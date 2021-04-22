//
//  ControlsView.swift
//  Drawing Test
//
//  Created by Samuel Shi on 4/19/21.
//

import SwiftUI

struct ControlsView: View {
  @ObservedObject var manager: DrawingManager
  
  var body: some View {
    HStack {
      strokeControls
      Spacer()
      reverseControls
    }.padding()
  }
  
  var strokeControls: some View {
    HStack {
      Button(action: manager.decreaseStroke) {
        Image(systemName: "minus")
          .padding(5)
      }
      
      Text("\(Int(manager.currentStroke))")
        .foregroundColor(.primary)
      
      Button(action: manager.increaseStroke) {
        Image(systemName: "plus")
          .padding(5)
      }
    }.controlBackground()
  }
  
  var reverseControls: some View {
    HStack {
      Button(action: manager.undo) {
        Image(systemName: "arrow.uturn.backward")
          .padding(5)
      }
        
      Button(action: manager.clear) {
        Image(systemName: "trash")
          .padding(5)
      }
    }.controlBackground()
  }
}

extension View {
  func controlBackground() -> some View {
    self
      .background(Color("controlBackground"))
      .clipShape(Capsule())
  }
}
