class Api::IngredientsController < ApplicationController
  before_filter :validate_access_token
  has_scope :by_name
  
  def index
    @ingredients = apply_scopes(Ingredient).all
    @ingredients_names = @ingredients.collect {|i| i.name}
    render :index, status: :ok
  end
end