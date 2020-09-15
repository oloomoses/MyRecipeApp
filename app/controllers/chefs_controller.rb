class ChefsController < ApplicationController
  before_action :set_chef, only: [:show, :edit, :update]
  before_action :require_login, only: [:edit, :update, :show, :create, :destroy]
  before_action :require_same_user, only: [:edit, :update, :delete]


  def new
    @chef = Chef.new
  end

  def index
    @chefs = Chef.all
  end

  def show    
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
    
  end

  def update

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

    def set_chef
      @chef = Chef.find(params[:id])
    end

    def require_same_user
      if current_user != @chef
        flash[:danger] = "You cannot perfom this action"
        redirect_back fallback_location: :back
      end
    end
end