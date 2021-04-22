//
//  Sidebar.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import SwiftUI

struct Sidebar: View {
  @ObservedObject var store: PeopleManager
  @Binding var selectedPerson: Int?
  
  var body: some View {
    List {
      ForEach(store.allPeople.identifiableIndices) { index in
        NavigationLink(
          destination: PersonView(person: $store.allPeople[index])
        ) {
          Text(store.allPeople[index].name)
            .font(.headline)
        }
      }
    }
    .listStyle(SidebarListStyle())
  }
}
