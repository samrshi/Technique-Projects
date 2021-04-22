//
//  ContentView.swift
//  Drawing Test
//
//  Created by Samuel Shi on 4/16/21.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var manager = DrawingManager()
  
  var body: some View {
    ZStack(alignment: .top) {
      Drawing(pointGroups: manager.lines)
      
      Color.clear
        .contentShape(Rectangle())
        .ignoresSafeArea()
        .gesture(drag)
      
      ControlsView(manager: manager)
    }
  }
  
  var drag: some Gesture {
    DragGesture()
      .onChanged { value in manager.addPoint(value.location) }
      .onEnded { _ in manager.createNextLine() }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
