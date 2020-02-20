//
//  ContentView.swift
//  sokoban
//
//  Created by Роенко Денис on 18.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI


struct MakeSurface: View {
    @ObservedObject var surface: Surface
   
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0...surface.height-1, id: \.self) { y in
                HStack(spacing: 2) {
                    ForEach(0...self.surface.width-1, id: \.self) { x in self.surface.surface[x][y] }
                }
            }
        }.offset(y: 20)
    }
}

struct ContentView: View {
    @ObservedObject var surface: Surface
    @State private var surfaceWidth: String = ""
    @State private var surfaceHeight: String = ""
       
    var body: some View {
        VStack {
            MakeSurface(surface: surface)
            Spacer()
            Divider()
            HStack {
                Divider()
                Text("Ширина поля")
                TextField(String(surface.width), text: $surfaceWidth) {
                    self.surface.width = Int(self.surfaceWidth)!
                    print(self.surface.width)
                }
                Divider()
                Text("Высота поля")
                TextField(String(surface.height), text: $surfaceHeight) {
                    self.surface.height = Int(self.surfaceHeight)!
                    print(self.surface.height)
                }
                Divider()

            }.frame(width: 700, height: 50)
        }.frame(width: 800, height: 750)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(surface: Surface(width: 20, height: 20, box: nil, man: nil, wall: nil))
    }
}
