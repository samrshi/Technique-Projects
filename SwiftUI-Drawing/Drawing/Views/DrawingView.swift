//
//  DrawingView.swift
//  Drawing Test
//
//  Created by Samuel Shi on 4/16/21.
//

import SwiftUI

struct Drawing: View {
  let pointGroups: [Line]
  
  var body: some View {
    ForEach(pointGroups, id: \.id) { line in
      pathForLine(with: line)
    }
  }
  
  func pathForLine(with line: Line) -> some View {
    Path { path in
      for (index, point) in line.points.enumerated() {
        if index == 0 {
          path.move(to: point)
        }
        
        path.addLine(to: point)
      }
    }
    .stroke(Color.blue, style: StrokeStyle(lineWidth: line.stroke, lineCap: .round, lineJoin: .round))
  }
}

extension Array where Element == CGPoint {
  var id: UUID {
    UUID()
  }
}
