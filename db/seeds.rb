#Seed for testing purposes

#Users
User.create!( name: "Admin", email: "admin@ruby.com", password: "asd123", confirmed_at: Time.now, role: "admin", )
User.create!( name: "User A", email: "user-a@ruby.com", password: "asd123", confirmed_at: Time.now, )
User.create!( name: "User B", email: "user-b@ruby.com", password: "asd123", confirmed_at: Time.now, )

#Food
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

#recipes
Recipe.create!( name: "Banana Smoothie", description: "Blend bananas with milk and honey for a delicious smoothie.", user_id: 1, public: true, preparation_time: 10, cooking_time: 2, )
Recipe.create!( name: "Orange Chicken", description: "Make a tangy orange glaze and use it to coat crispy chicken pieces.", user_id: 2, public: true, preparation_time: 14, cooking_time: 7, )
Recipe.create!( name: "Strawberry Cheesecake", description: "Prepare a classic cheesecake topped with fresh strawberries.", user_id: 3, public: true, preparation_time: 7, cooking_time: 18, )
Recipe.create!( name: "Pineapple Banana Salad", description: "Combine pineapples and bananas with a hint of lime juice for a refreshing salad.", user_id: 1, public: false, preparation_time: 14, cooking_time: 18, )
Recipe.create!( name: "Orange Creamsicle Smoothie", description: "Blend oranges with vanilla ice cream for a delightful creamsicle smoothie.", user_id: 2, public: false, preparation_time: 18, cooking_time: 18, )
Recipe.create!( name: "Mango Salsa", description: "Dice mangoes and mix with onions, cilantro, and lime juice for a tasty salsa.", user_id: 3, public: false, preparation_time: 14, cooking_time: 7, )



