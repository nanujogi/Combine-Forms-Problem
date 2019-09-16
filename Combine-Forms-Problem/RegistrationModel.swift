import SwiftUI
import Combine
import CryptoKit
//import CombinePrintout

class RegistrationModel : ObservableObject {
    
    @Published var eMail: String = ""
    @Published var password: String = ""
    @Published var passwordRepeat: String = ""
    
    @Published var hasheMail: String = ""
    
    let q = DispatchQueue(label: "com.xyz.combine.experimenting")
    
//    public var willChange = PassthroughSubject<Void, Never>()
    
    var validatedEMail: AnyPublisher<String?, Never> {
        return $eMail
            //            .print("✏️ $eMail pipeline")
            //            .debounce(for: 0.5, scheduler: q)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { username in
                return Future { promise in
//                    print("username: \(username)")
                    //DispatchQueue.main.async {
                    self.usernameAvailable(username) { available in
//                        print("available: \(available)")
                        promise(.success(available ? username : nil))
                    }
                    //}
                }
        }
        .switchToLatest()
        .eraseToAnyPublisher()
    }
    
    var validatedPassword: AnyPublisher<String?, Never> {
        return Publishers.CombineLatest($password, $passwordRepeat)
            //            .subscribe(on: RunLoop.main)
            //            .receive(on: RunLoop.main)
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .map { password, passwordRepeat in
//                print("password: \(password), passwordRepeat: \(passwordRepeat)")
                guard password == passwordRepeat, password.count > 5 else { return nil }
                
                return password
        }
        .eraseToAnyPublisher()
    }
    
    var validatedCredentials: AnyPublisher<(String, String)?, Never> {
        return Publishers.CombineLatest(validatedEMail, validatedPassword)
            
            .receive(on: RunLoop.main) // run on main thread
            .map { validatedEMail, validatedPassword in
//                print("validatedEMail: \(validatedEMail ?? "not set"), validatedPassword: \(validatedPassword ?? "not set")")
                
                guard let eMail = validatedEMail, let password = validatedPassword else { return nil }
                
                return (eMail, password)
                
        }
        .eraseToAnyPublisher()
    }
    
    func usernameAvailable(_ username: String, completion: (Bool) -> Void) {
        
        let isValidEMailAddress: Bool = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}").evaluate(with: username)
        
//        if isValidEMailAddress {
//            if let data = username.lowercased().data(using: .utf8) {
//                let hash = SHA256.hash(data: data)
//                hasheMail = hash.description
//                print(hash.description)
//            }
//        }
        completion(isValidEMailAddress)
    }
}
