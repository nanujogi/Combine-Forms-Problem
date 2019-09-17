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
                Image(systemName: "person.fill")
                    Text("Show All Users")
            }
            .tag(1)
        } // end of TabView
    }
}
