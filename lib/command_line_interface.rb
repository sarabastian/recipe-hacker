
require "tty-prompt"

require 'rest-client'
require 'json'
require 'pry'


#login or be prompted to create account
def welcome_and_login
    puts "welcome to recipehack! we're here to make your life easier and generate recipes for you based on what you already have in the pantry."
    puts ""
#like a recipe, but don't have all the ingredients? save an ingredient to your shopping list, which you can add to or delete

    puts "Is this your first time here? (y/n)"
    if gets.chomp == "n"
        puts "Welcome back!"
        existing_user
    
    else
        puts "Let's get you signed up" 
        create_user
    end
   
end

#allows a user to sign in with their username and password, and won't allow login if either is wrong
def existing_user
    
    puts "what's your username?"
    username_input = gets.chomp
    puts "and finally, password?"
    password_input = gets.chomp
    
    if User.exists?(username: username_input, password: password_input) == true
    puts "Hi, again. Let's get started!"
  
    else "We can't seem to find you. Try logging in again" 
        existing_user
    end
end


#allows a user to sign up (create a username and password) and checks if username is already taken
def create_user
    puts "Please enter a username you'd like"

    new_username_input = gets.chomp
    user = User.find_by(username: new_username_input)
    if user == nil
        puts "Please enter a password"
        new_user_password_input = gets.chomp
        puts "Great, you're officially a recipe-hacker!"
        user = User.create(username: new_username_input, password: new_user_password)
    else puts "whoops! that username has already been taken."
        create_user
    end
    
end

#menu of options user can choose from
def menu
        puts ""
        puts "How can we help you? Please enter a number from the menu below to get started"
        puts ""

            puts "1 - Find recipes based on ingredients you already have"
            puts "2 - View my recipes"
            puts "3 - Delete a recipe"
        gets.chomp
        if gets.chomp == "1"
            recipe_list
        end
            
            
        
    end
#         puts menu_table
        
#        

 
#         elsif gets.chomp == "2"
#             save_recipe
#         elsif gets.chomp == "3"
        

#         elsif gets.chomp == "5"
#             menu_is_active ==false
#     end
# end

# end

#user enters three ingredients, which are pushed into an array (and used for searching within the api)
def get_ingredients_from_user
    user_ingredients = []
    puts "let's start the recipe hacking! what ingredient do you have handy?"
    puts ""
    user_ingredient_1 = gets.chomp
    user_ingredients << user_ingredient_1
    
    puts ""
    puts "please enter a second ingredient."
    
    
    user_ingredient_2 = gets.chomp
    user_ingredients << user_ingredient_2
    
    puts ""
    puts "last but not least, please enter your third ingredient."
    

    user_ingredient_3 = gets.chomp
    user_ingredients << user_ingredient_3
    puts ""
    puts "generating recipes for #{(user_ingredients).join(", ")}"
    return user_ingredients
end

#for option 1 - output recipes based on ingredients users input
def recipe_list
    order_recipe_titles
end

#for option 2 - create & save new recipe instance & associate with the user (by creating a usersrecipe instance)
def save_recipe(title, user)
   r = Recipe.create(title: title)
   UsersRecipe.create(user_id: user.id, recipe_id: r.id)

end
#for option 3 - see saved recipes
# def see_saved_recipes
#     array = []
#     saved_recipes = UsersRecipe.all.collect do | r.id|
# end
# end

#for option 4 - delete a recipe
def delete_recipe
end


