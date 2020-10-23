
require "tty-prompt"

require 'rest-client'
require 'json'
require 'pry'
$current_user = nil

#login or be prompted to create account
def welcome_and_login
    puts "welcome to recipe hacker! we're here to make your life easier and generate recipes for you based on what you already have in the pantry."
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
    puts "and password?"
    password_input = gets.chomp
    
    $current_user = User.find_by(username: username_input, password: password_input) 
    if $current_user == nil
        puts ""
    puts "We can't seem to find you. Try logging in again" 
        existing_user
    else puts "Hi, again. Let's get started!"
        
    end
end


#allows a user to sign up (create a username and password), checks if username is already taken, creates new user instance
def create_user
    puts "Please enter a username you'd like"

    new_username_input = gets.chomp
    $current_user = User.find_by(username: new_username_input)
    if $current_user == nil
        puts "Please enter a password"
        new_user_password_input = gets.chomp
        puts ""
        puts "YAY, you're now a recipe-hacker!"
        $current_user = User.create(username: new_username_input, password: new_user_password_input)
    else puts "whoops! that username has already been taken."
        create_user
    end
    
end

#menu of options user can choose from
def menu
        puts ""
        puts "How can we help you? Please enter a number from the menu below to get started"
        puts ""

            puts "1 - Find recipes based on ingredients I already have"
            puts "2 - View my recipes"
            puts "3 - Edit recipe list"
    
        
        if gets.chomp == "1"
            
            save_recipe_from_recipe_list
            puts ""
            puts "saved! redirecting you to the main menu for more recipe hacks"
            puts ""
            menu
        elsif gets.chomp == "2"
            puts see_saved_recipes
        elsif gets.chomp == "3"
            
            see_saved_recipes
       
        end
    end



#user enters three ingredients, which are pushed into an array (and used for searching within the api)
def get_ingredients_from_user
    
    user_ingredients = []
    puts ""
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
    puts "generating recipes for #{(user_ingredients).join(", ")}..."
    puts ""
    return user_ingredients
    
end



#for option 1 - put the variables from this file into the api communicator methods
def recipe_list
    ingred = get_ingredients_from_user
    placeholder = get_recipe_titles(ingred)
    order_recipe_titles(placeholder)
end

#returns list of recipes
def save_recipe_from_recipe_list
    new_list = []
    new_list << recipe_list
    puts new_list
    puts ""
    puts "enter the number of the corresponding recipe you'd like to save"

    corres_number = gets.chomp
    choice = new_list[corres_number.to_i-1]
    
    #save_recipe(choice)
    r = Recipe.create(title: choice)
    UsersRecipe.create(user_id: $current_user.id, recipe_id: r.id)
 end
    
    


# #for option 1&2 - create & save new recipe instance & associate with the user (by creating a usersrecipe instance)
# def save_recipe(title)
  
#    r = Recipe.create(title: title)
#    UsersRecipe.create(user_id: $current_user.id, recipe_id: r.id)
# end

#for option 3 - see saved recipes
def see_saved_recipes
    
    saved_recipes = UsersRecipe.where(user_id: $current_user.id)
    if saved_recipes = []
        puts "hmm, we're not finding any stored recipes. want to try searching and saving some?"
        menu
    else 
        recipe_id_array = saved_recipes.collect do |instance|
            instance.recipe_id
        end
        recipe_id_array.collect do |recipe|
            puts Recipe.find(recipe).title
        end
    end
end
    
        
    
    
    #"#{index+1}. #{userrecipe["title"]}"
        
   


#for option 4 - delete a recipe
# def delete_recipe
# end


