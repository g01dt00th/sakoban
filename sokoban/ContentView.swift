//
//  ContentView.swift
//  sokoban
//
//  Created by Роенко Денис on 18.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var surface: Surface
    @State private var surfaceWidth = ""
    @State private var surfaceHeight = ""
    
    var body: some View {
        VStack {
            
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

            }.frame(width: 600, height: 50)
        }.frame(width: 700, height: 500)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(surface: Surface(width: 20, height: 20, box: nil, man: nil, wall: nil))
    }
}
