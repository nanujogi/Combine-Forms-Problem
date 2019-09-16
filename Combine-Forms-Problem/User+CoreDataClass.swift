//
//  User+CoreDataClass.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 13/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//
//

import CoreData
import SwiftUI

//@objc(User)
public class User: NSManagedObject, Identifiable {
    @NSManaged public var usremail: String?
    @NSManaged public var usrpassword: String?
    @NSManaged public var appname: String?
    @NSManaged public var id: String?
    
}

extension User {
    // ❇️ The @FetchRequest property wrapper in the ContentView will call this function
    static func alldataFetchRequest() -> NSFetchRequest<User> {
        let request: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
        
        // ❇️ The @FetchRequest property wrapper in the ContentView requires a sort descriptor
        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(User.usremail), ascending: true)]
        
        return request
    }
}

