class IngredientsController < ApplicationController
  before_action :draw_ingredient, only: [ :edit, :update ]

  def index
    @ingredients = Ingredient.all
  end

  def new
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      # success
      redirect_to ingredients_path
    else
      # failure, error handling
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ingredient.update(ingredient_params)
      # success
      redirect_to ingredients_path
    else
      # failure, error handling
      render 'edit'
    end
  end

  private

  def draw_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
