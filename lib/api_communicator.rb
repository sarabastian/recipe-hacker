# require 'rest-client'
# require 'json'
# require 'pry'



#base_url = "http://www.recipepuppy.com/api/"
# recipe_generation_url = base_url + "?i=" + user_ingredients.join(",")


def get_recipes_from_api
    n = 1
    all_recipes = []
    100.times do
        response_string = RestClient.get('http://www.recipepuppy.com/api/?p=#{n}') 
        response_hash = JSON.parse(response_string)
        all_recipes << response_hash["results"]
        n+=1
    end
    all_recipes
 end