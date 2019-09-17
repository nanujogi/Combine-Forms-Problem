//
//  MyAllUsers.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 16/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData

class MyAllUsers: ObservableObject {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.managedContext
    
    lazy var specificuserPredicate: NSPredicate = {
        return NSPredicate(format: "%K == %@", #keyPath(User.usremail), "nanu@grenleaf.com")
    }()
    
    @Published var pubUsers = [User]()
    
    var myusers: [User] = []
    
    func populateSpecificUser() {
        
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
         fetchRequest.predicate = specificuserPredicate
        
        do {
            let myusers = try  managedObjectContext.fetch(fetchRequest)
//            print(myusers)
            pubUsers = myusers
        } catch let error as NSError {
            print ("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
