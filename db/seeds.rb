#Seed for testing purposes

# Users
User.create!( name: "Admin", email: "admin@ruby.com", password: "asd123", confirmed_at: Time.now, role: "admin", )
User.create!( name: "User A", email: "user-a@ruby.com", password: "asd123", confirmed_at: Time.now, role: "user", )
User.create!( name: "User B", email: "user-b@ruby.com", password: "asd123", confirmed_at: Time.now, role: "user", )

# Food
Food.create!( name: "Banana", price: 2, measurement_unit: "grams",)
Food.create!( name: "Orange", price: 3, measurement_unit: "grams",)
Food.create!( name: "Pineapple", price: 4, measurement_unit: "grams",)
Food.create!( name: "Strawberry", price: 5, measurement_unit: "grams",)
Food.create!( name: "Mango", price: 6, measurement_unit: "grams",)
Food.create!( name: "Kiwi", price: 7, measurement_unit: "grams",)
Food.create!( name: "Peach", price: 8, measurement_unit: "grams",)
Food.create!( name: "Watermelon", price: 9, measurement_unit: "grams",)
Food.create!( name: "Pear", price: 4, measurement_unit: "grams",)
Food.create!( name: "Chicken", price: 10, measurement_unit: "kilograms",)
Food.create!( name: "Milk", price: 2, measurement_unit: "liters",)

# Recipes
Recipe.create!( name: "Banana Smoothie", description: "Blend bananas with milk and honey for a delicious smoothie.", user_id: 1, public: true, preparation_time: 10, cooking_time: 2, )
Recipe.create!( name: "Orange Chicken", description: "Make a tangy orange glaze and use it to coat crispy chicken pieces.", user_id: 2, public: true, preparation_time: 14, cooking_time: 7, )
Recipe.create!( name: "Strawberry Cheesecake", description: "Prepare a classic cheesecake topped with fresh strawberries.", user_id: 3, public: true, preparation_time: 7, cooking_time: 18, )
Recipe.create!( name: "Pineapple Banana Salad", description: "Combine pineapples and bananas with a hint of lime juice for a refreshing salad.", user_id: 1, public: false, preparation_time: 14, cooking_time: 18, )
Recipe.create!( name: "Orange Creamsicle Smoothie", description: "Blend oranges with vanilla ice cream for a delightful creamsicle smoothie.", user_id: 2, public: false, preparation_time: 18, cooking_time: 18, )
Recipe.create!( name: "Mango Salsa", description: "Dice mangoes and mix with onions, cilantro, and lime juice for a tasty salsa.", user_id: 3, public: false, preparation_time: 14, cooking_time: 7, )

# Recipes Food
RecipeFood.create!( quantity: 2, recipe_id: 1, food_id: 1, )
RecipeFood.create!( quantity: 1, recipe_id: 1, food_id: 11, )
RecipeFood.create!( quantity: 1, recipe_id: 1, food_id: 10, )
RecipeFood.create!( quantity: 4, recipe_id: 2, food_id: 2, )
RecipeFood.create!( quantity: 1, recipe_id: 2, food_id: 11, )
RecipeFood.create!( quantity: 1, recipe_id: 2, food_id: 10, )
RecipeFood.create!( quantity: 1, recipe_id: 3, food_id: 4, )
RecipeFood.create!( quantity: 1, recipe_id: 3, food_id: 11, )
RecipeFood.create!( quantity: 1, recipe_id: 3, food_id: 10, )
RecipeFood.create!( quantity: 3, recipe_id: 4, food_id: 3, )
RecipeFood.create!( quantity: 1, recipe_id: 4, food_id: 1, )
RecipeFood.create!( quantity: 1, recipe_id: 4, food_id: 10, )
RecipeFood.create!( quantity: 2, recipe_id: 5, food_id: 2, )
RecipeFood.create!( quantity: 1, recipe_id: 5, food_id: 1, )
RecipeFood.create!( quantity: 1, recipe_id: 5, food_id: 10, )
RecipeFood.create!( quantity: 2, recipe_id: 6, food_id: 5, )
RecipeFood.create!( quantity: 1, recipe_id: 6, food_id: 11, )
RecipeFood.create!( quantity: 1, recipe_id: 6, food_id: 10, )


# Inventories for each user ID
Inventory.create!( name: "Admin Inventory 1", description: "Lacus vel facilisis volutpat est velit egestas dui id ornare arcu odio ut sem nulla pharetra diam sit amet nisl suscipit adipiscing bibendum est ultricies", user_id: 1, )
Inventory.create!( name: "Admin Inventory 2", description: "Bibendum arcu vitae elementum curabitur vitae nunc sed velit dignissim sodales ut eu sem integer vitae justo eget magna fermentum iaculis eu non diam phasellus.", user_id: 1, )
Inventory.create!( name: "User A Inventory 1", description: "Sit amet consectetur adipiscing elit pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas integer eget aliquet nibh praesent tristique magna.", user_id: 2, )
Inventory.create!( name: "User A Inventory 2", description: "Dolor sit amet consectetur adipiscing elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus.", user_id: 2, )
Inventory.create!( name: "User B Inventory 1", description: "Vel turpis nunc eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim facilisis gravida neque convallis a cras semper auctor neque vitae tempus quam.", user_id: 3, )
Inventory.create!( name: "User B Inventory 2", description: "Adipiscing at in tellus integer feugiat scelerisque varius morbi enim nunc faucibus a pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius.", user_id: 3, )

# Inventory Food
FoodInventory.create!( quantity: 10, inventory_id: 1, food_id: 1, )
FoodInventory.create!( quantity: 20, inventory_id: 1, food_id: 2, )
FoodInventory.create!( quantity: 30, inventory_id: 1, food_id: 3, )
FoodInventory.create!( quantity: 40, inventory_id: 2, food_id: 4, )
FoodInventory.create!( quantity: 50, inventory_id: 2, food_id: 5, )
FoodInventory.create!( quantity: 60, inventory_id: 2, food_id: 6, )
FoodInventory.create!( quantity: 70, inventory_id: 3, food_id: 7, )
FoodInventory.create!( quantity: 80, inventory_id: 3, food_id: 8, )
FoodInventory.create!( quantity: 90, inventory_id: 3, food_id: 9, )
FoodInventory.create!( quantity: 100, inventory_id: 4, food_id: 10, )
FoodInventory.create!( quantity: 110, inventory_id: 4, food_id: 11, )
FoodInventory.create!( quantity: 120, inventory_id: 4, food_id: 1, )
FoodInventory.create!( quantity: 130, inventory_id: 5, food_id: 2, )
FoodInventory.create!( quantity: 140, inventory_id: 5, food_id: 3, )
FoodInventory.create!( quantity: 150, inventory_id: 5, food_id: 4, )
FoodInventory.create!( quantity: 160, inventory_id: 6, food_id: 5, )
FoodInventory.create!( quantity: 170, inventory_id: 6, food_id: 6, )
FoodInventory.create!( quantity: 180, inventory_id: 6, food_id: 7, )

