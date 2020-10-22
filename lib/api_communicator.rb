require 'rest-client'
require 'json'
require 'pry'




# # #getting an array of recipes from the api, based on user input of ingredients
def get_recipe_titles
    search_params = 'http://www.recipepuppy.com/api/?i=' + get_ingredients_from_user.join(",")
  

    recipes = []
    search_string = RestClient.get(search_params)
    search_hash = JSON.parse(search_string)
    relevant_recipes = search_hash["results"]
    relevant_recipes.collect do |recipe|
        recipes << recipe["title"]
    end
    
    recipes
end

#order recipes in a list based on result (an array) from get_recipe_titles
# def order_recipe_titles
#     get_recipe_titles.each_with_index do |title, i|
#         puts "#{i+1}. #{title}"
#     end
# end


