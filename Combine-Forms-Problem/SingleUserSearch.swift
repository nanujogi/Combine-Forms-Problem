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

class SingleUserSearch: ObservableObject {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).coreDataStack.managedContext
    
    lazy var specificuserPredicate: NSPredicate = {
        return NSPredicate(format: "%K == %@", #keyPath(User.usremail), "nanu@grenleaf.com")
    }()
    
    @Published var pubUsers = [User]()
    @Published var mystrdate = ""
    @Published var userfound: Bool = false
    
    var myusers: [User] = []
    
    func populateSpecificUser() {
        
//        let fetchRequest: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
        let fetchRequest = NSFetchRequest<User>(entityName: "User")
         fetchRequest.predicate = specificuserPredicate
//        fetchRequest.fetchLimit = 1
        
        do {
            let myusers = try  managedObjectContext.fetch(fetchRequest)
//            print(myusers)
            if myusers.count > 0 {
                mystrdate = sdate(dtsent: myusers[0].date)
                pubUsers = myusers
                userfound = true
            }
            else {
                userfound = false
                print("Error could not fetch user")
            }

        } catch let error as NSError {
            print ("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func sdate(dtsent: Date) -> String {
            let myFormatter = DateFormatter()
    //        myFormatter.dateStyle = .short
            myFormatter.dateFormat = "dd-MM-yyyy"
            let newDate1 = myFormatter.string(from: dtsent)
            return newDate1
            
        }
}
