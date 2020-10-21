require 'pry'
def welcome
    puts "welcome to recipehack!
    we're here to make your life easier and generate recipes for you based on what you already have in the pantry.
    Begin by entering three ingredients you have in stock."
end
#like a recipe, but don't have all the ingredients? save an ingredient to your shopping list, which you can add to or delete

def login  #login or be prompted to create account
    puts "Is this your first time here? (y/n)"
    if gets.chomp == "n"
        puts "Welcome back. Please enter your username"
        existing_user
    elsif gets.chomp == 'y' 
        create_user
    end
end

def existing_user
    puts "what's your name again?"
    name_input = gets.chomp
    puts "and username?"
    username_input = gets.chomp
    puts "password once more?"
    password_input = gets.chomp
    user = User.find_by(name: name_input, username: username_input, password: password_input)
    if user.valid?
    username_input = gets.chomp
  
    else "We can't seem to find you. Try again!" 
    end
end



def existing_password(password)
    puts "Welcome back, #{username}. Please enter your password"
    password = gets.chomp
    if valid_password(password) == true 
        "Redirecting you to our home page"
    else puts "Hm, can't find you. Try again?"
    end
end

def valid_password(password)
    if User.find_by(password: password)
        return true
    else return false
    end
end

def create_user(name, username, password)
    puts "What's your first name?"
    name = gets.chomp

    puts "Please enter a username"
    puts 
    User.create(:name, :username, :password)
end



def get_user_ingredients
    user_ingredients = [] 
    puts "Please enter your first ingredient."
    
    user_ingredient_1 = gets.chomp
    user_ingredients.push(user_ingredient_1)
    
    puts "Please enter a second ingredient."
    
    user_ingredient_2 = gets.chomp
    user_ingredients << user_ingredient_2
    
    puts "Last but not least, pls enter your third ingredient."
    
    user_ingredient_3 = gets.chomp
    user_ingredients << user_ingredient_3
    return user_ingredients
    
end

  

def get_recipes
    search_params = 'http://www.recipepuppy.com/api/?i=' + get_user_ingredients.join(",")

    relevant_recipes = []
    search_string = RestClient.get(search_params)
    search_hash = JSON.parse(search_string)
    relevant_recipes << search_hash["results"]
    relevant_recipes.collect do |recipe|
        puts recipe["title"] 
    end
end

  