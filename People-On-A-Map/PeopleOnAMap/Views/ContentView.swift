//
//  ContentView.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import SwiftUI

struct ContentView: View {
  @StateObject var store = PeopleManager()
  @State private var selectedPerson: Int? = 0
  
  var body: some View {
    NavigationView {
      Sidebar(store: store, selectedPerson: $selectedPerson)
      
      Text("Select person...")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
