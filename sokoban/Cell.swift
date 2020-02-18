//
//  Cell.swift
//  sokoban
//
//  Created by Роенко Денис on 18.02.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import SwiftUI

struct Cell: View {
    var symbol = ""
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 37, height: 37)
                .foregroundColor(.white)
                .border(Color.black, width: 1)
            Text(symbol)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.black)
        }
    }
}

struct Cell_Previews: PreviewProvider {
    static var previews: some View {
        Cell(symbol: "􀉩")
    }
}
