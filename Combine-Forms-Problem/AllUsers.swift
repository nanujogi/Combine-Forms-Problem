//
//  AllUsers.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 14/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI

struct AllUsers: View {
    
    @FetchRequest(fetchRequest: User.alldataFetchRequest()) var myblogIdeas: FetchedResults<User>

    var body: some View {
        
        Section(header: Text("User from CoreData")) {
                List {
                    ForEach(self.myblogIdeas) {myblogIdea in
                        VStack(alignment: .leading) {
                            Text(myblogIdea.usremail ?? "")
                                .font(.headline)
                            Text(myblogIdea.usrpassword ?? "")
                                .font(.headline)
                            Text(myblogIdea.appname ?? "")
                                .font(.subheadline)
                            Text(myblogIdea.id ?? "")
                        }
                    }
                }
        }
        .font(.headline)
        .animation(.easeInOut)
        
    }
}

