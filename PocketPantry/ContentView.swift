import SwiftUI
import Firebase

struct ContentView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fname = ""
    @State private var lname = ""
    @State private var passwordCheck = ""
    @State private var loggedIn = false
    @State var uid = ""
    @StateObject var dataManager = DataManager()
    @State private var signUp = false
    @State private var showSettings = false
    
    // settings variables
    @AppStorage("showPreview") var showPreview = true
    @AppStorage("fontSize") var fontSize = 12.0
    enum Tabs: Hashable {
        case general, advanced
    }
    
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
                                        
                                        Button {
                                            switchToSettingsView()
                                            
                                        } label: {
                                            Text("Settings")
     
                                        }
                                        if showSettings{
                                            SettingsView
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
        else if signUp {
            registerView
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
                        loggedIn = false
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
            else {
                print("Successfully logged in: \(result?.user.uid ?? "")")
                self.uid = result?.user.uid ?? ""
            }
        }
    }
    
    func switchToRegisterView(){
        self.signUp = true
    }
    
    func switchToSettingsView(){
        if showSettings {
            self.showSettings = false

        }else{
            self.showSettings = true
        }
    }
    
    var registerView: some View {
        ZStack {
            Color.cyan

            VStack(spacing: 20) {
                Text("Pocket Pantry")
                    .foregroundColor(.white)
                    .font(.system(size:40, weight: .bold, design: .rounded))
                    .offset(x: 0, y: -70)
                
                Group {
                    TextField("First Name", text: $fname)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: fname.isEmpty) {
                            Text("First Name")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width:300, height: 1)
                        .foregroundColor(.white)
                        .padding(.bottom)
                    
                    TextField("Last Name", text: $lname)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: lname.isEmpty) {
                            Text("Last Name")
                                .foregroundColor(.white)
                                .bold()
                        }
                    
                    Rectangle()
                        .frame(width:300, height: 1)
                        .foregroundColor(.white)
                    
                    
                }
                
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
                
                SecureField("Confirm Password", text: $passwordCheck)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                    .placeholder(when: passwordCheck.isEmpty) {
                        Text("Confirm Password")
                            .foregroundColor(.white)
                            .bold()
                    }
                
                Rectangle()
                    .frame(width:300, height: 1)
                    .foregroundColor(.white)
                
                if (!isEqual(a: password, b: passwordCheck)) {
                    Text("Passwords do not match")
                        .foregroundColor(.red)
                        .font(.system(size:18, weight: .bold, design: .rounded))

                }

                Button {
                    register()
                    loggedIn.toggle()
                } label: {
                    Text("Create Account")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(.white)
                        )
                        .foregroundColor(.blue)
                }
                //.padding(.top)
                .offset(y: 50)

            }
            .frame(width: 300)
            .onAppear {
                Auth.auth().addStateDidChangeListener { auth, user in
                    if user != nil {
                        loggedIn.toggle()
                        signUp.toggle()
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
    
    var SettingsView: some View {
        
        VStack {
            Color.gray
            TabView {
                GeneralSettingsView
                    .tabItem {
                        Label("General", systemImage: "gear")
                    }
                    .tag(Tabs.general)
                AdvancedSettingsView
                    .tabItem {
                        Label("Advanced", systemImage: "star")
                    }
                    .tag(Tabs.advanced)
            }
            .padding(20)
            .frame(width: 375, height: 200)
            .offset(x: -70, y: -150)
        }
        
    }
    
    var GeneralSettingsView: some View {

        Form {
            Toggle("Show Previews", isOn: $showPreview)
            Slider(value: $fontSize, in: 9...96) {
                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 250)
        
    }
    
    var AdvancedSettingsView: some View {
       
        Form {
            Toggle("Show Advanced Previews", isOn: $showPreview)
            Slider(value: $fontSize, in: 9...96) {
                Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
            }
        }
        .padding(20)
        .frame(width: 350, height: 250)
    }
    
    // add another screen for the sign up
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil{
                print("Failed to create user:", error!.localizedDescription)
                return
            }
            else {
                print("Successfully created user: \(result?.user.uid ?? "")")
                self.uid = result?.user.uid ?? ""
            }
        }
    }
    func isEqual(a: String, b: String) -> Bool {
        return a == b
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

