sara = User.create(name: "Sara", username: 'sbastian', password: 'jack24')
sienna = User.create(name: "Sienna", username: 'smori', password: 'bike')
rachel = User.create(name: "Rachel", username: 'rjsmith', password: 'lobster')
hannah = User.create(name: "Hannah", username: 'axelgirl', password: 'gtownlaw')

r1 = Recipe.create(title: "Salted Shortbread Cookies")
r2 = Recipe.create(title: "Sour Cream N Onion Burgers")
r3 = Recipe.create(title: "Delicata Squash Stuffed With Dried Fruit and Nuts")
r4 = Recipe.create(title: "Lemon-Walnut Pesto Stuffed Cherry Tomatoes" )

# butter = Ingredient.create(name: "Butter", user_id: 2, recipe_id: 1)
# onion = Ingredient.create(name: "Onion", user_id: 3, recipe_id: 2)
# squash = Ingredient.create(name: "Squash", user_id: 2, recipe_id: 3)
# paprika = Ingredient.create(name: "Paprika",user_id: 4, recipe_id: 4)
# tomato = Ingredient.create(name: "Tomato", user_id: 3, recipe_id: 4)

ur1 = UsersRecipe.create(user_id: 1, recipe_id: 2)
ur2 = UsersRecipe.create(user_id: 3, recipe_id: 1)
ur3 = UsersRecipe.create(user_id: 2, recipe_id: 4)

UsersRecipe.destroy_all
User.destroy_all
Recipe.destroy_all