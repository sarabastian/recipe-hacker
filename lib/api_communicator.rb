require 'rest-client'
require 'json'
require 'pry'

def get_recipe_titles
    search_params = 'http://www.recipepuppy.com/api/?i=' + get_ingredients_from_user.join(",")
  

    recipes = []
    search_string = RestClient.get(search_params)
    search_hash = JSON.parse(search_string)
    relevant_recipes = search_hash["results"]
    relevant_recipes.collect do |recipe|
        recipes << recipe["title"].strip
    end
    
    recipes
end

def order_recipe_titles
    get_recipe_titles.each_with_index do |title, i|
        puts "#{i+1}. #{title}"
    end
end


