//
//  MailView.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import SwiftUI
import MapKit

struct MapView: View {
  @Binding var person: Person
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      Map(
        coordinateRegion: $person.region,
        annotationItems: [person]) { p in
        MapAnnotation(
          coordinate: p.coordinate,
          anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
          Circle()
            .stroke(Color.blue)
            .frame(width: 44, height: 44)
        }
      }
      
      Text(person.name)
        .font(.headline)
        .padding(5)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(5.0)
        .padding([.leading, .top])
    }
  }
}

struct MapViewPreview: PreviewProvider {
  static var previews: some View {
    MapView(person: .constant(.abby))
      .frame(minWidth: 300, minHeight: 300)
  }
}

