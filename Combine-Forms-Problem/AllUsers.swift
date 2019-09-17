//
//  AllUsers.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 14/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI

struct AllUsers: View {
    
    @FetchRequest(fetchRequest: User.alldataFetchRequest()) var allmyusers: FetchedResults<User>

    var body: some View {
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
                }
        //}
        .font(.headline)
        .animation(.easeInOut)
    }
}

