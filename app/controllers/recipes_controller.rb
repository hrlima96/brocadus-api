class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:ingredients)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipes_url
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :time_to_prepare, :yield, :method_of_preparation, :ingredient_ids => [])
  end
end
