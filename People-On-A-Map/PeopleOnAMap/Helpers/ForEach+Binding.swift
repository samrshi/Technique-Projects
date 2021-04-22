//
//  Helper.swift
//  RedditHelp2
//
//  Created by Samuel Shi on 4/22/21.
//

// FROM SwiftBySundell: https://www.swiftbysundell.com/articles/bindable-swiftui-list-elements/

import SwiftUI

struct IdentifiableIndices<Base: RandomAccessCollection>
where Base.Element: Identifiable {
  
  typealias Index = Base.Index
  
  struct Element: Identifiable {
    let id: Base.Element.ID
    let rawValue: Index
  }
  
  fileprivate var base: Base
}

extension IdentifiableIndices: RandomAccessCollection {
  var startIndex: Index { base.startIndex }
  var endIndex: Index { base.endIndex }
  
  subscript(position: Index) -> Element {
    Element(id: base[position].id, rawValue: position)
  }
  
  func index(before index: Index) -> Index {
    base.index(before: index)
  }
  
  func index(after index: Index) -> Index {
    base.index(after: index)
  }
}

extension RandomAccessCollection where Element: Identifiable {
  var identifiableIndices: IdentifiableIndices<Self> {
    IdentifiableIndices(base: self)
  }
}

extension ForEach where ID == Data.Element.ID,
                        Data.Element: Identifiable,
                        Content: View {
  init<T>(
    _ indices: Data,
    @ViewBuilder content: @escaping (Data.Index) -> Content
  ) where Data == IdentifiableIndices<T> {
    self.init(indices) { index in
      content(index.rawValue)
    }
  }
}
