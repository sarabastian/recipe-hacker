
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
    puts "what's your name again?"
    name_input = gets.chomp
    puts "and username?"
    username_input = gets.chomp
    puts "and finally, password?"
    password_input = gets.chomp
    
    if User.exists?(name: name_input, username: username_input, password: password_input) == true
    puts "Hi, again, #{name_input}. Let's get started!"
  
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
        puts "What can we call you?"
        new_name = gets.chomp
        puts "Great, you're officially a recipe-hacker!"
        user = User.create(name: new_name, username: new_username_input, password: new_user_password)
    else puts "whoops! that username has already been taken."
        create_user
    end
    
end

#menu of options user can choose from
def menu
    menu_is_active == true
    #logic for when user did not enter 3
    while menu_is_active
        puts ""
        puts "How can we help you? Please enter a number from the menu below to get started"
        puts ""

        def menu_table
            puts "1 - Find and save a recipe based on ingredients you already have in stock"
            puts "2 - View past recipes"
            puts "3 - exit"
            
            
        end
        puts menu_table
        
        if gets.chomp == "1"
            get_recipe_titles
 
        # elsif gets.chomp == "2"
        

        elsif gets.chomp == "3"
            menu_is_active ==false
    end
end

end

#user enters three ingredients, which are pushed into an array (and used for searching within the api)
def get_ingredients_from_user
    user_ingredients = []
    puts "let's start the recipe hacking! what ingredient do you have handy?"
    
    user_ingredient_1 = gets.chomp
    user_ingredients << user_ingredient_1
    
    puts ""
    puts "please enter a second ingredient."
    puts ""
    
    user_ingredient_2 = gets.chomp
    user_ingredients << user_ingredient_2
    
    puts "last but not least, please enter your third ingredient."
    
    user_ingredient_3 = gets.chomp
    user_ingredients << user_ingredient_3
    
    puts "generating recipes for #{(user_ingredients).join(", ")}"
    return user_ingredients
end

# def recipe_list
#     ingred = get_ingredients_from_user
#     get_recipe_titles
# def list_of_recipes
#     inputs = get_ingredients_from_user
# end


  