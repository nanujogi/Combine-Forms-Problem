//
//  FormView.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 17/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI
import Combine
import CoreData
import CryptoKit

struct FormView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var registrationModel = RegistrationModel()

    @State private var registrationButtonDisabled = true
    @State private var validatedEMail: String = ""
    @State private var validatedPassword: String = ""
    @State private var hasheMail: String = ""
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
                    //                    print("🌼 newValidatedCredentials: \(String(describing: newValidatedCredentials))")
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
                
                // First time if running comment below line. Add some email & password
                // then uncomment & run
                
                //                AllUsers()
                //                MyUsers()
                
                
                //                Text("Email id: \(blogIdeas[0].usremail ?? "")")
                //                Text("Password \(blogIdeas[0].usrpassword ?? "")")
                //                Text("App Name \(blogIdeas[0].appname ?? "")")
            }
        } // end of Form
        
    }
    
    func registrationButtonAction() {
        print("Create Account Clicked")
        print("Valid email: \(validatedEMail)")
        print("Valid password: \(validatedPassword)")
        
        if let data = validatedEMail.lowercased().data(using: .utf8) {
            let hash = SHA256.hash(data: data)
            hasheMail = hash.description
            print(hash.description)
            
            let user = User(context: self.managedObjectContext)
            user.usremail = "\(validatedEMail.lowercased())"
            user.usrpassword = "\(validatedPassword)"
            
            //  user.usrpassword = self.validatedPassword
            user.id = UUID().uuidString
            user.appname = "myForm"
            
            // user.usrpassword = hash.description
            
            do {
                try self.managedObjectContext.save()
                print("saved email & password to coredata")
            } catch let error as NSError {
                print ("Could not Save \(error), \(error.userInfo)")
            }
        }
    }
}

