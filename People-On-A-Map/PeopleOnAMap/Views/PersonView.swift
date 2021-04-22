//
//  FolderView.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import SwiftUI

struct PersonView: View {
  @Binding var person: Person
  
  
  var body: some View {
    NavigationView {
      VStack {
        Image(person.photo)
          .resizable()
          .scaledToFill()
          .frame(width: 100, height: 100)
          .clipShape(Circle())
        
        Divider()
        
        Text(person.name)
          .bold()
          .font(.largeTitle)
          .multilineTextAlignment(.center)
        
        Text(person.address)
          .multilineTextAlignment(.center)
          .padding(.top, 5)
      }
      
      MapView(person: $person)
    }
    .navigationTitle(person.name)
  }
}

struct PersonViewPreview: PreviewProvider {
  static var previews: some View {
    PersonView(person: .constant(.abby))
      .frame(minWidth: 300, minHeight: 300)
  }
}
