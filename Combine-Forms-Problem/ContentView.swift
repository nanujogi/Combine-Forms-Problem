import SwiftUI
import Combine

struct ContentView : View {
    
    @ObservedObject var registrationModel = RegistrationModel()
    
    @State private var registrationButtonDisabled = true
    
    @State private var validatedEMail: String = ""
    @State private var validatedPassword: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Enter your EMail", text: $registrationModel.eMail)
                SecureField("Enter a Password", text: $registrationModel.password)
                SecureField("Enter the Password again", text: $registrationModel.passwordRepeat)
                
                Button(action: registrationButtonAction) {
                    Text("Create Account")
                }
                .disabled($registrationButtonDisabled.wrappedValue)
                .onReceive(self.registrationModel.validatedCredentials) { newValidatedCredentials in
                    print("🌼 newValidatedCredentials: \(String(describing: newValidatedCredentials))")
                    self.$registrationButtonDisabled.wrappedValue = (newValidatedCredentials == nil)
                }
            }
            
            Section {
                Text("Validated EMail: \(validatedEMail)")
                    .onReceive(self.registrationModel.validatedEMail) { newValidatedEMail in
                        self.validatedEMail = newValidatedEMail != nil ? newValidatedEMail! : "EMail invalid"
                }
                
                Text("Validated Password: \(validatedPassword)")
                    .onReceive(self.registrationModel.validatedPassword) { newValidatedPassword in
                        self.validatedPassword = newValidatedPassword != nil ? newValidatedPassword! : "Passwords to short or don't match"
                }
            }
        }
        .navigationBarTitle(Text("Sign Up"))
    }
    
    func registrationButtonAction() {
        print("Create Account Clicked")
    }
}
