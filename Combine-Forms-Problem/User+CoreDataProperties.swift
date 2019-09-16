////
////  User+CoreDataProperties.swift
////  Combine-Forms-Problem
////
////  Created by Nanu Jogi on 13/09/19.
////  Copyright © 2019 Greenleaf Software. All rights reserved.
////
////
//
////
////  User+CoreDataProperties.swift
////  Combine-Forms-Problem
////
////  Created by Nanu Jogi on 13/09/19.
////  Copyright © 2019 Greenleaf Software. All rights reserved.
////
////
//
//import Foundation
//import CoreData
//
////extension User {
////
////    //    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
////    //        return NSFetchRequest<User>(entityName: "User")
////    //    }
////
////    @NSManaged public var usremail: String?
////    @NSManaged public var usrpassword: String?
////    @NSManaged public var id: UUID?
////
////}
//
////extension User {
////    // ❇️ The @FetchRequest property wrapper in the ContentView will call this function
////    static func alldataFetchRequest() -> NSFetchRequest<User> {
////        let request: NSFetchRequest<User> = User.fetchRequest() as! NSFetchRequest<User>
////
////        // ❇️ The @FetchRequest property wrapper in the ContentView requires a sort descriptor
////        request.sortDescriptors = [NSSortDescriptor(key: #keyPath(User.usremail), ascending: true)]
////
////        return request
////    }
//}
