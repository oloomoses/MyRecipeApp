class RecipesController < ApplicationController
  before_action :require_login, except: [:index, :show]
  before_action :set_recipe, only: [:show, :edit, :update, :like]
  before_action :require_same_user, only: [:edit, :update, :delete]

  def index    
    @recipes = Recipe.paginate(page: params[:page], per_page: 3)
  end

  def show

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = current_user

    if @recipe.save
      flash[:success] = 'Recipe created successfull'
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe update!'
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def like
    like = Like.create(likes: params[:like], chef: current_user, recipe: @recipe)

    if like.valid?
      flash[:success] = 'selection success!'
      redirect_back fallback_location: :back
    else
      flash[:danger] = 'like/dislike once'
      redirect_back fallback_location: :back
    end
  end

  private 
    def recipe_params
      params.require(:recipe).permit(:name, :summary, :description, :picture)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def require_same_user
      if current_user != @recipe.chef
        flash[:danger] = "You cannot perform this action"
        redirect_back fallback_location: :back
      end
    end
end