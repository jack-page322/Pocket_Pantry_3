import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack(alignment: .center) {
            HStack(alignment: .center){
              Text("Pocket Pantry")
            }
            HStack{
                NavigationView {
                    Button(action: {}){
                        Text("View Pantry")
                        .bold()
                        .font(Font.custom("Helvetica Neue", size: 14.0))
                        .padding(20)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(12)
                        }
                        .toolbar {
                            ToolbarItemGroup(placement: .bottomBar) {
                                Button("Home") {
                                    print("Pressed")
                                }

                                Spacer()

                                Button("Settings") {
                                    print("Pressed")
                                }
                            }
                        }
                }
            }
            Spacer()
        }//.background(Color.mint)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
