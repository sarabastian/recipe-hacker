
require "tty-prompt"

require 'rest-client'
require 'json'
require 'pry'


prompt = TTY::Prompt.new

def welcome
    puts "welcome to recipehack! we're here to make your life easier and generate recipes for you based on what you already have in the pantry."
end
#like a recipe, but don't have all the ingredients? save an ingredient to your shopping list, which you can add to or delete

def login  #login or be prompted to create account
    puts "Is this your first time here? (y/n)"
    if gets.chomp == "n"
        puts "Welcome back. Please enter your username"
        existing_user
    
    else 
        puts "let's get you signed up" 
        create_user
    end
end

def existing_user
    puts "what's your name again?"
    name_input = gets.chomp
    puts "and username?"
    username_input = gets.chomp
    puts "and finally, password?"
    password_input = gets.chomp
    
    if User.exists?(name: name_input, username: username_input, password: password_input)
    puts "Hi, again, #{name_input}. Let's get started!"
  
    else "We can't seem to find you. Try again!" 
    end
end



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

def get_ingredients_from_user
    user_ingredients = []
    puts "let's start the recipe hacking! what ingredient do you have handy?"
    
    user_ingredient_1 = gets.chomp
    user_ingredients.push(user_ingredient_1)
    
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
    


  