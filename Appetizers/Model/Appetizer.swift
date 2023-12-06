//
//  Appetizer.swift
//  Appetizers
//
//  Created by Rahul Rai on 04/11/23.
//

import Foundation


struct Appetizer: Decodable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let protein: Int
    let carbs: Int
}


struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

// Mock data for making the UI

// DUMMY

struct MockData {
    static let fries = Appetizer(id: 0001,
                                 name: "French Fries",
                                 description: "Crispy and delicious french fries",
                                 price: 3.99,
                                 imageURL: "friesImage",
                                 calories: 450,
                                 protein: 4,
                                 carbs: 54)
    
    static let burger = Appetizer(id: 0002,
                                  name: "Classic Burger",
                                  description: "Juicy beef burger with cheese and vegetables",
                                  price: 8.99,
                                  imageURL: "burgerImage",
                                  calories: 700,
                                  protein: 32,
                                  carbs: 40)
    
    static let onionRings = Appetizer(id: 0003,
                                      name: "Onion Rings",
                                      description: "Crunchy onion rings with a special dipping sauce",
                                      price: 5.99,
                                      imageURL: "onionRingsImage",
                                      calories: 350,
                                      protein: 6,
                                      carbs: 45)
    
    static let mozzarellaSticks = Appetizer(id: 0004,
                                           name: "Mozzarella Sticks",
                                           description: "Golden fried mozzarella sticks with marinara sauce",
                                           price: 6.99,
                                           imageURL: "mozzarellaSticksImage",
                                           calories: 300,
                                           protein: 14,
                                           carbs: 23)
    
    static let chickenWings = Appetizer(id: 0005,
                                       name: "Chicken Wings",
                                       description: "Spicy buffalo chicken wings with blue cheese dressing",
                                       price: 9.99,
                                       imageURL: "chickenWingsImage",
                                       calories: 550,
                                       protein: 25,
                                       carbs: 12)
    
    static let bruschetta = Appetizer(id: 0006,
                                      name: "Bruschetta",
                                      description: "Toasted bread topped with fresh tomatoes, basil, and olive oil",
                                      price: 7.99,
                                      imageURL: "bruschettaImage",
                                      calories: 200,
                                      protein: 5,
                                      carbs: 30)
    
    static let appetizers = [fries, burger, onionRings, mozzarellaSticks, chickenWings, bruschetta]
    
    // Creating another mock data for order screen
    static let orderItems = [fries, burger, onionRings]
    
    
}
