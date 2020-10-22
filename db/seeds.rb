User.destroy_all
Recipe.destroy_all
UsersRecipe.destroy_all

sara = User.create(username: 'sbastian', password: 'jack24')
sienna = User.create(username: 'smori', password: 'bike')
rachel = User.create(username: 'rjsmith', password: 'lobster')
hannah = User.create(username: 'axelgirl', password: 'gtownlaw')

r1 = Recipe.create(title: "Salted Shortbread Cookies")
r2 = Recipe.create(title: "Sour Cream N Onion Burgers")
r3 = Recipe.create(title: "Delicata Squash Stuffed With Dried Fruit and Nuts")
r4 = Recipe.create(title: "Lemon-Walnut Pesto Stuffed Cherry Tomatoes" )

ur1 = UsersRecipe.create(user_id: 1, recipe_id: 2)
ur2 = UsersRecipe.create(user_id: 3, recipe_id: 1)
ur3 = UsersRecipe.create(user_id: 2, recipe_id: 4)
