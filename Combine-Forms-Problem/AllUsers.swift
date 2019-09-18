//
//  AllUsers.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 14/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI

struct AllUsers: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(fetchRequest: User.alldataFetchRequest()) var allmyusers: FetchedResults<User>

    var body: some View {
        NavigationView {
        //Section(header: Text("User from CoreData")) {
                List {
                    ForEach(self.allmyusers) { myuser in
                        VStack(alignment: .leading) {
                            Text(myuser.usremail ?? "")
                                .font(.headline)
                            Text(myuser.usrpassword ?? "")
                                .font(.headline)
                            Text(myuser.appname ?? "")
                                .font(.subheadline)
                            Text(myuser.id ?? "")
                                .font(.system(.caption))
                        }
                    }
                .onDelete(perform: removeUser)
                }
        //}
        .font(.headline)
        .animation(.easeInOut)
    }
    .navigationBarTitle("Users")
    .navigationBarItems(trailing: EditButton())
    }
    
    func removeUser(at offsets: IndexSet) {

        for index in offsets {
            let useridx = allmyusers[index]
            managedObjectContext.delete(useridx)
        }
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print ("Delete User while saving Could not save \(error), \(error.userInfo)")
        }
        
    }
    
}

