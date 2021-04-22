//
//  Mail.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import Foundation
import MapKit

struct Person: Identifiable {
  let id       = UUID()
  let name     : String
  let photo    : String
  let address  : String
  let coordinate : CLLocationCoordinate2D
  var region   : MKCoordinateRegion
  
  internal init(
    name: String,
    photo: String,
    address: String,
    latitude: Double,
    longitude: Double
  ) {
    self.name = name
    self.photo = photo
    self.address = address
    self.coordinate = .init(
      latitude: latitude,
      longitude: longitude)
    
    self.region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(
        latitudeDelta : 0.05,
        longitudeDelta: 0.05
      )
    )
  }
}

extension Person {
  static let abby = Person(
    name: "Abby Weiss",
    photo: "person2",
    address: "1600 Pennsylvania Avenue NW\nWashington, DC 20500",
    latitude: 38.8977,
    longitude: -77.0365
  )

  static let melody = Person(
    name: "Melody Johnson",
    photo: "person3",
    address: "One Apple Park Way\nCupertino, CA 95014",
    latitude: 37.3230,
    longitude: -122.0322
  )

  static let steve = Person(
    name: "Steve Robin",
    photo: "person1",
    address: "237 S Wilmington St\nRaleigh, NC 27601",
    latitude: 35.777060,
    longitude: -78.638040
  )
}
