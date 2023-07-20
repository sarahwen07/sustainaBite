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
    let webpageURL: URL?
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
        FoodItem(id: UUID(), name: "Healthy Eggs Benedict", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://downshiftology.com/recipes/healthy-eggs-benedict/")),
        
        FoodItem(id: UUID(), name: "Mediterranean Chickpea Salad", isVegan: true, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://downshiftology.com/recipes/mediterranean-chickpea-salad/")),
        
        FoodItem(id: UUID(), name: "Vanilla Cake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://glutenfreeonashoestring.com/very-best-gluten-free-vanilla-cake/")),
        
        FoodItem(id: UUID(), name: "Muffins", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://littlespicejar.com/gluten-free-blueberry-muffins/")),
        
        FoodItem(id: UUID(), name: "Grilled Salmon + Chermoula Chickpeas", isVegan: false, isVegetarian: false, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: false, webpageURL: URL(string: "https://www.eatthis.com/grilled-salmon-chermoula-chickpeas-recipe/")),
        
        // 2. Vegan Recipes
        FoodItem(id: UUID(), name: "Creamy Vegan Pasta", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://www.loveandlemons.com/vegan-recipes/#wprm-recipe-container-42838")),
        
        FoodItem(id: UUID(), name: "Cauliflower Tacos", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.acouplecooks.com/crispy-cauliflower-tacos/")),
        
        FoodItem(id: UUID(), name: "Morrocan Spiced Chickpea Bowl", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://pinchofyum.com/morrocan-spiced-chickpea-glow-bowl#tasty-recipes-42300-jump-target")),
        
        FoodItem(id: UUID(), name: "Peanut Butter Cookie Bars", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://www.loveandlemons.com/vegan-desserts/#wprm-recipe-container-44704")),
        
        FoodItem(id: UUID(), name: "Vegan Chocolate Tart", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://www.bbcgoodfood.com/recipes/easy-chocolate-tart")),
        
        // 3. Dairy-Free Recipes
        FoodItem(id: UUID(), name: "Lemon Chicken with Orzo", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.tasteofhome.com/recipes/lemon-chicken-with-orzo/")),
        
        FoodItem(id: UUID(), name: "Dairy-Free Brownies", isVegan: false, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://richanddelish.com/dairy-free-brownies/")),
        
        FoodItem(id: UUID(), name: "Ratatouille", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://dwellbymichelle.com/easy-ratatouille/")),
        
        FoodItem(id: UUID(), name: "Coconut Chiffon Cake", isVegan: false, isVegetarian: true, isDairyFree: true, isGlutenFree: false, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://www.delicious.com.au/recipes/coconut-chiffon-cake-meringue-icing-dairy-free-cover-recipe/c115dcfd-80d3-49ea-a9b7-c42e49b6d9f5?current_section=recipes&r=recipes/collections/6dpvyun6")),
        
        FoodItem(id: UUID(), name: "Dairy-Free Chicken Curry", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://cooknourishbliss.com/2021/09/21/dairy-free-chicken-curry/")),
        
        // 4. Seafood Free Recipes
        FoodItem(id: UUID(), name: "Tuscan Chicken Pasta", isVegan: false, isVegetarian: false, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.yummly.com/recipe/Healthy-Tuscan-Chicken-Pasta-2626157")),
        
        FoodItem(id: UUID(), name: "No-Churn Fruit Sorbet", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.yummly.com/recipe/Healthy-No-Churn-Fruit-Sorbet-9073995")),
        
        FoodItem(id: UUID(), name: "Chicken Taco Bowls", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.yummly.com/recipe/Healthy-Chicken-Taco-Bowl-_Whole30__-2475223")),
        
        FoodItem(id: UUID(), name: "One Pot Pasta", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.yummly.com/recipe/Easy-One-Pot-Pasta-_-Cozy-_-Healthy-20-Minute-Dinner_-9194477#4f1e229f-771b-42a5-b49b-2ceaba5fb762")),
        
        FoodItem(id: UUID(), name: "Strawberry Shortcake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://cooking.nytimes.com/recipes/11823-strawberry-shortcake")),
        
        // 5. Nut free recipes
        FoodItem(id: UUID(), name: "Shrimp and Okra Gumbo", isVegan: false, isVegetarian: false, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: false, webpageURL: URL(string: "https://www.eatingwell.com/recipe/8057930/shrimp-okra-gumbo/")),
        
        FoodItem(id: UUID(), name: "Vegan Fettucine Alfredo", isVegan: true, isVegetarian: true, isDairyFree: true, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.fromthecomfortofmybowl.com/vegan-fettuccine-alfredo/")),
        
        FoodItem(id: UUID(), name: "Andes Mint Brownies", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.eatingwell.com/recipe/8055158/andes-mint-brownies/")),
        
        FoodItem(id: UUID(), name: "Apple Butter Cake Roll", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.tasteofhome.com/recipes/apple-butter-cake-roll/")),
        
        FoodItem(id: UUID(), name: "Nut-Free Pesto", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://themom100.com/recipe/nut-free-pesto/")),
        
        // 6. Vegetarian
        FoodItem(id: UUID(), name: "Mushroom Curry", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.bbcgoodfood.com/recipes/simple-mushroom-curry")),
        
        FoodItem(id: UUID(), name: "Plum and Apple Cobbler", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.bbcgoodfood.com/recipes/plum-apple-cobbler")),
        
        FoodItem(id: UUID(), name: "Shaved Brussel Sprouts Salad", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: false, noSeafood: true, webpageURL: URL(string: "https://themodernproper.com/shaved-brussels-sprout-salad-with-creamy-maple-dressing")),
        
        FoodItem(id: UUID(), name: "Chocolate Molten Cake", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: false, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://www.bbcgoodfood.com/recipes/easy-chocolate-molten-cakes")),
        
        FoodItem(id: UUID(), name: "Vegetable Fritata", isVegan: false, isVegetarian: true, isDairyFree: false, isGlutenFree: true, noNuts: true, noSeafood: true, webpageURL: URL(string: "https://feelgoodfoodie.net/recipe/vegetable-frittata/")),
        
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
            Section(header: Text("Filter Options")
                  .font(Font.custom("Poppins-SemiBold", size: 20))
                  .foregroundColor(Color("darkGreen"))
                ) {
              Toggle("Vegan", isOn: $showVeganOnly)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
                
              Toggle("Vegetarian", isOn: $showVegetarianOnly)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
                
              Toggle("Dairy-Free", isOn: $showDairyFreeOnly)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
                
              Toggle("Gluten-Free", isOn: $showGlutenFreeOnly)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
                
              Toggle("Nut-Free", isOn: $showNoNuts)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
                
              Toggle("Seafood-Free", isOn: $showNoSeafood)
                    .font(Font.custom("Poppins-Regular", size: 18))
                    .foregroundColor(Color("darkGreen"))
            }
            .foregroundColor(Color("darkGreen"))
            .listRowBackground(Color("offWhite"))
            .tint(Color("teaGreen"))
             
              
          //------------------ Font Changes ------------------
            Section(header: Text("Food Items - Click for Recipe!")
                  .font(Font.custom("Poppins-SemiBold", size: 19))
                  .foregroundColor(Color("darkGreen"))
                    
              )
              {
              ForEach(filteredFoodItems) { food in
                  Link(destination: food.webpageURL!) {
                      Text(food.name)
                  }
              }
            }
            .foregroundColor(Color("darkGreen"))
            .listRowBackground(Color("offWhite"))
          }
          .background(Color("almond"))
          .scrollContentBackground(.hidden)
          .navigationBarTitle("Food Filters")
            
          .toolbar{
                ToolbarItemGroup(placement: .status) {
                    NavigationLink(destination: WelcomeView()) {
                        Image("homeIcon")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
                            .frame(width: 100.0, height: 80.0)
                    }
                    .padding(.top)
                    .navigationBarTitleDisplayMode(.inline)
     //               .navigationBarHidden(false)
                    
                    NavigationLink(destination: MapViewX()) {
                        Image("mapIcon")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
                            .frame(width: 100.0, height: 80.0)
                            .padding(.horizontal, -30)
                    }
                    .padding(.top)
                    .navigationBarTitleDisplayMode(.inline)
        //            .navigationBarHidden(false)
                    
                    
                    NavigationLink(destination: FoodView()) {
                        Image("searchIcon")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
                            .frame(width: 100.0, height: 80.0)
                            .padding(.trailing, -30)
                    }
                    .padding(.top)
                    .navigationBarTitleDisplayMode(.inline)
    //                .navigationBarHidden(false)
                   
                    NavigationLink(destination: AboutView()) {
                        Image("infoIcon")
                            .resizable(capInsets: EdgeInsets())
                            .aspectRatio(contentMode: .fit)
                            .padding(.vertical)
                            .frame(width: 100.0, height: 80.0)
                    }
                    .padding(.top)
                    .navigationBarTitleDisplayMode(.inline)
                }

          }

        }
        Color("almond").ignoresSafeArea()
      }.navigationBarBackButtonHidden(true)
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
