//
//  MyUsers.swift
//  Combine-Forms-Problem
//
//  Created by Nanu Jogi on 16/09/19.
//  Copyright © 2019 Greenleaf Software. All rights reserved.
//

import SwiftUI
import CoreData

struct MyUsers: View {
    
    @ObservedObject var store = MyAllUsers()
    
    var body: some View {
        //Section(header: Text("My Code")) {
            List(store.pubUsers) { myusr in
                //ForEach(self.store.pubUsers) { myusr in
                    VStack(alignment: .leading) {
                        Text(myusr.usremail ?? "")
                            .font(.headline)
                        Text(myusr.usrpassword ?? "")
                            .font(.headline)
                        Text(myusr.appname ?? "")
                            .font(.subheadline)
                        Text(myusr.id ?? "")
                            .font(.system(.caption))
                        Text("\(myusr.date)")
                            .font(.system(.caption))
                    }
                //}
            }
            .foregroundColor(Color.pink)
            .animation(.easeInOut)
        //}
        .onAppear(perform: { self.store.populateSpecificUser() })
    }
}

