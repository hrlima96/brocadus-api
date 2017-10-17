class Api::RecipesController < ApplicationController
  before_filter :validate_access_token

  def index
    @recipes = Recipe.search_by_ingredients(recipe_params["ingredients"])

    render :index
  end

  private

  def recipe_params
    params.permit("ingredients" => [])
  end

end
