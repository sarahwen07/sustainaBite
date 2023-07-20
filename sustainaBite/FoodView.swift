import SwiftUI
struct FoodItem: Identifiable {
  let id: UUID
  let name: String
  let isVegan: Bool
  let isVegetarian: Bool
  let isDairyFree: Bool
  let isGlutenFree: Bool
  let noNuts: Bool
  let noSeafood: Bool
}
struct FoodView: View {
  init() {
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(red: 0.22, green: 0.29, blue: 0.09, alpha: 1.00)]
    navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor(red: 0.22, green: 0.29, blue: 0.09, alpha: 1.00)]
    }
  @State private var showVeganOnly = false
  @State private var showVegetarianOnly = false
  @State private var showDairyFreeOnly = false
  @State private var showGlutenFreeOnly = false
  @State private var showNoNuts = false
  @State private var showNoSeafood = false
  // Sample food items for demonstration purposes
  let sampleFoodItems: [FoodItem] = [
    
    // 1. Gluten-free
    FoodItem(id: UUID(), name: "Healthy Eggs Benedict", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Mediterranean Chickpea Salad", isVegan: true, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Vanilla Cake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true),

    FoodItem(id: UUID(), name: "Muffins", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Grilled Salmon + Chermoula Chickpeas", isVegan: false, isVegetarian: false, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: false),
    
    // 2. Vegan Recipes
    FoodItem(id: UUID(), name: "Creamy Vegan Pasta", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Cauliflower Tacos", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Morrocan Spiced Chickpea Bowl", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Peanut Butter Cookie Bars", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: false, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Vegan Chocolate Tart", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true),
    
    // 3. Dairy-Free Recipes
    FoodItem(id: UUID(), name: "Lemon Chicken with Orzo", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Dairy-Free Brownies", isVegan: false, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Ratatouille", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Coconut Chiffon Cake", isVegan: false, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Dairy-Free Chicken Curry", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: false, noSeafood: true),
    
    // 4. Seafood Free Recipes
    FoodItem(id: UUID(), name: "Tuscan Chicken Pasta", isVegan: false, isVegetarian: false, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "No-Churn Fruit Sorbet", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Chicken Taco Bowls", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "One Pot Pasta", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Strawberry Shortcake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    // 5. Nut free recipes
    FoodItem(id: UUID(), name: "Shrimp and Okra Gumbo", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: false),
    
    FoodItem(id: UUID(), name: "Vegan Fettucine Alfredo", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Andes Mint Brownies", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Apple Butter Cake Roll", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Nut-Free Pesto", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    // 6. Vegetarian
    FoodItem(id: UUID(), name: "Mushroom Curry", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Plum and Apple Cobbler", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Shaved Brussel Sprouts Salad", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: false, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Chocolate Molten Cake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true),
    
    FoodItem(id: UUID(), name: "Vegetable Fritata", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true),
    
    // Add more food items here
  ]
  var filteredFoodItems: [FoodItem] {
    sampleFoodItems.filter {
      food in
      (!showVeganOnly || food.isVegan) &&
      (!showVegetarianOnly || food.isVegetarian) &&
      (!showDairyFreeOnly || food.isDairyFree) &&
      (!showGlutenFreeOnly || food.isGlutenFree) &&
      (!showNoNuts || food.noNuts) &&
      (!showNoSeafood || food.noSeafood)
    }
  }
    
  var body: some View {
    NavigationView{
      ZStack {
        Form {
          Section(header: Text("Filter Options")) {
            Toggle("Vegan", isOn: $showVeganOnly)
            Toggle("Vegetarian", isOn: $showVegetarianOnly)
            Toggle("Dairy-Free", isOn: $showDairyFreeOnly)
            Toggle("Gluten-Free", isOn: $showGlutenFreeOnly)
            Toggle("Nut-Free", isOn: $showNoNuts)
            Toggle("Seafood-Free", isOn: $showNoSeafood)
          }
          .foregroundColor(Color("darkGreen"))
          .listRowBackground(Color("offWhite"))
          .tint(Color("lapisBlue"))
          Section(header: Text("Filtered Food Items")) {
            ForEach(filteredFoodItems) { food in
              Text(food.name)
            }
          }
          .foregroundColor(Color("darkGreen"))
          .listRowBackground(Color("offWhite"))
        }
        .background(Color("almond"))
        .scrollContentBackground(.hidden)
        .navigationBarTitle("Food Filters")
      }
      Color("almond").ignoresSafeArea()
    }
  }
}

struct FoodView_Previews: PreviewProvider {
  static var previews: some View {
    FoodView()
  }
}

extension UIColor {
  public convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    return nil
  }
}
