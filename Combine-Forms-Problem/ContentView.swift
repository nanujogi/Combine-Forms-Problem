import SwiftUI
import Combine
import CryptoKit
import CoreData

struct ContentView : View {
    
    var body: some View {
        TabView {
            FormView()
                .tabItem {
                    Image(systemName: "textbox")
                    Text("Form Input")
            }
            .tag(0)
              
            AllUsers()
                .tabItem {
                Image(systemName: "person.2.square.stack.fill")
                    Text("Show All Users")
            }
            .tag(1)
            
            MyUsers()
                .tabItem {
                Image(systemName: "person.fill")
                    Text("Single User")

            }
            .tag(2)
        } // end of TabView
    }
}
