class RecipesController < ApplicationController
  before_action :draw_recipe, only: [ :edit, :update ]

  def index
    @recipes = Recipe.all
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      # success
      redirect_to recipes_path
    else
      # failure, error handling
      render 'edit'
    end
  end

  def new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      # success
      redirect_to recipes_path
    else
      # failure, error handling
      render 'new'
    end
  end

  private

  def draw_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, ingredient_ids: [])
  end
end
