//
//  PersonManager.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

import Foundation

final class PeopleManager: ObservableObject {
  @Published var allPeople: [Person] = [.abby, .melody, .steve]
}
