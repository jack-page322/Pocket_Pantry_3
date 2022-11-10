import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var loggedIn = false
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        if loggedIn {
            VStack{
                HStack{
                    NavigationView{
                        NavigationLink(destination: pantryView().environmentObject(dataManager)){
                            Text("View Pantry")
                                .bold()
                                .font(Font.custom("Helvetica Neue", size: 14.0))
                                .padding(20)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(12)
                            
                                .toolbar {
                                    ToolbarItemGroup(placement: .bottomBar) {
                                        Button("Account") {
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
                    // End VStack
                }
            }
        }
        else {
            loginView
        }
    }
    
    
    var loginView: some View {
        ZStack {
            Color.cyan
            
            //            RoundedRectangle(cornerRadius: 30, style: .continuous)
            //                .foregroundStyle(.linearGradient(colors: [.cyan, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
            //                .frame(width: 1000, height: 400)
            //                .rotationEffect(.degrees(135))
            //                .offset(y: -350)
            
<<<<<<< Updated upstream
=======
                VStack(spacing: 20) {
                    Text("Pocket Pantry")
                        .foregroundColor(.white)
                        .font(.system(size:40, weight: .bold, design: .rounded))
                        .offset(x: 0, y: -100)
                    
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                                
                        }
                    
                    Rectangle()
                        .frame(width:300, height: 1)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width:300, height: 1)
                        .foregroundColor(.white)
                    
                    
                    VStack{
                        Button {
                            login()
                        } label: {
                            Text("Log in")
                                .bold()
                                .frame(width: 200, height: 40)
                                .background(
                                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                                        .fill(.white)
                                )
                                .foregroundColor(.blue)
                        }
                        .padding(.top)
                        .offset(y: 100)
                    }
                    
                    Button {
                        switchToRegisterView()
                       
                    } label: {
                        Text("Sign Up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.white)
                            )
                            .foregroundColor(.blue)
                    }
                    .padding(.top)
                    .offset(y: 100)
                }
    
            .frame(width: 300)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        loggedIn = true
                        print(user.uid ?? "")
                    }
                }
            }
            
        }
        .ignoresSafeArea()
    
    }
        
    func login() {
        print("Attempting log in...")
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print("Login Error")
                print(error!.localizedDescription)
            }
            else {
                print("Successfully logged in: \(result?.user.uid ?? "")")
                self.uid = result?.user.uid ?? ""
                dataManager.setUID(with: self.uid)
            }
        }
    }
    
    func switchToRegisterView(){
        self.signUp = true
    }
    
    func switchToSettingsView(){
        self.showSettings = true
    }
    
    var registerView: some View {
        ZStack {
            Color.cyan

>>>>>>> Stashed changes
            VStack(spacing: 20) {
                Text("Pocket Pantry")
                    .foregroundColor(.white)
                    .font(.system(size:40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -100)
                
                TextField("Email", text: $email)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .textCase(.lowercase)
                    .placeholder(when: email.isEmpty) {
                        Text("Email")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:300, height: 1)
                    .foregroundColor(.white)
                    .padding(.bottom)
                
                
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: password.isEmpty) {
                        Text("Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:300, height: 1)
                    .foregroundColor(.white)
                
                Button {
                    login()
                } label: {
                    Text("Log in")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white)
                        )
                        .foregroundColor(.blue)
                }
                .padding(.top)
                .offset(y: 100)
                
                Button {
                    register()
                } label: {
                    Text("Don't have an account? Sign up")
                        .bold()
                        .foregroundColor(.white)
                    
                }
                .padding(.top)
                .offset(y: 110)
            }
            .frame(width: 300)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        loggedIn.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
        
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    // add another screen for the sign up
    func register() {
        print("Attempting register...")
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
<<<<<<< Updated upstream
                print(error!.localizedDescription)
=======
                print("Failed to create user:", error!.localizedDescription)
                return
            }
            else {
                print("Successfully created user: \(result?.user.uid ?? "")")
                self.uid = result?.user.uid ?? ""
                dataManager.setUID(with: self.uid)
>>>>>>> Stashed changes
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View {
    func placeholder<Content: View> (
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
        }
    }
}

