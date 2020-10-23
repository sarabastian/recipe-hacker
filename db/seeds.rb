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


UsersRecipe.create(user_id: sara.id, recipe_id: r3.id)
UsersRecipe.create(user_id: sienna.id, recipe_id: r2.id)
UsersRecipe.create(user_id: sara.id, recipe_id: r1.id)