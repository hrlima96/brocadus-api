json.array! @recipes do |recipe|
  json.id recipe.id
  json.name recipe.name
  json.time_to_prepare recipe.time_to_prepare
  json.yield recipe.yield
  json.method_of_preparation recipe.method_of_preparation
  json.ingredients recipe.ingredients
end
