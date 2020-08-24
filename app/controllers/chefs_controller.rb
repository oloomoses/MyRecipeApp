class ChefsController < ApplicationController
  def new
    @chef = Chef.new
  end

  def index
    @chefs = Chef.all
  end

  def show
    @chef = Chef.find(params[:id])
    @recipe = @chef.recipes.paginate(page: params[:page], per_page: 3)
  end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      flash[:success] = 'Account created successfully, You can now login!'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @chef = Chef.find(params[:id])
  end

  def update
    @chef = Chef.find(params[:id])

    if @chef.update(chef_params)
      flash[:success] = 'User detals updated'
      redirect_to chefs_path
    else
      render :edit
    end
  end

  def destroy
  end

  private
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
end