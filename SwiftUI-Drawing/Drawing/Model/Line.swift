//
//  Line.swift
//  Drawing Test
//
//  Created by Samuel Shi on 4/16/21.
//

import SwiftUI

struct Line: Identifiable {
  let id = UUID()
  
  var points: [CGPoint]
  var stroke: CGFloat
}
