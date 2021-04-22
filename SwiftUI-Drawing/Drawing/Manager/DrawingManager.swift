//
//  DrawingManager.swift
//  Drawing Test
//
//  Created by Samuel Shi on 4/19/21.
//

import SwiftUI

class DrawingManager: ObservableObject {
  @Published var lines: [Line] = [Line(points: [], stroke: 10)]
  @Published var currentLineIndex = 0
  @Published var currentStroke: CGFloat = 10
  
  func addPoint(_ point: CGPoint) {
    lines[currentLineIndex].points.append(point)
  }
  
  func createNextLine() {
    currentLineIndex += 1
    lines.append(Line(points: [], stroke: currentStroke))
  }
  
  func increaseStroke() {
    currentStroke += 2
    lines[currentLineIndex].stroke = currentStroke
  }
  
  func decreaseStroke() {
    currentStroke -= 2
    lines[currentLineIndex].stroke = currentStroke
  }
  
  func undo() {
    withAnimation {
      guard currentLineIndex != 0 else { return }
      currentLineIndex -= 1
      lines[currentLineIndex] = Line(
        points: [],
        stroke: currentStroke
      )
      lines.removeLast()
    }
  }
  
  func clear() {
    withAnimation {
      lines = [Line(points: [], stroke: currentStroke)]
      currentLineIndex = 0
    }
  }
}
