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
    private let maxWidth = 20
    private let maxHeight = 10
       
    var body: some View {
        VStack {
            MakeSurface(surface: surface)
            Spacer()
            VStack(spacing: 0) {
                
                Button(action: {
                    //acrion here
                }, label: {
                    //label here
                    Text("Up")
                    }).padding(1)
                .clipShape(Capsule())
                .offset(x: -5)
                
                HStack(spacing: 2) {
                    Button(action: {
                        //acrion here
                    }, label: {
                        //label here
                        Text("Left")
                        }).padding(1)
                    .clipShape(Capsule())

                    
                    Button(action: {
                        //acrion here
                    }, label: {
                        //label here
                        Text("Down")
                        }).padding(1)
                    .clipShape(Capsule())
                    
                    Button(action: {
                        //acrion here
                    }, label: {
                        //label here
                        Text("Right")
                        }).padding(1)
                    .clipShape(Capsule())

                }
            }
            Spacer()
            Divider()
            HStack {
                Divider()
                Text("Ширина поля")
                TextField(String(surface.width), text: $surfaceWidth) {
                    if Int(self.surfaceWidth)! <= self.maxWidth {
                        self.surface.width = Int(self.surfaceWidth)!
                    }
                    else {
                        self.surface.width = self.maxWidth
                        self.surfaceWidth = String(self.maxWidth)
                    }
                    print(self.surface.width)
                }
                Divider()
                Text("Высота поля")
                TextField(String(surface.height), text: $surfaceHeight) {
                    if Int(self.surfaceHeight)! <= self.maxHeight {
                        self.surface.height = Int(self.surfaceHeight)!
                    }
                    else {
                        self.surface.height = self.maxHeight
                        self.surfaceHeight = String(self.maxHeight)

                    }
                    print(self.surface.width)
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
