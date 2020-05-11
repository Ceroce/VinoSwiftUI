//
//  ContentView.swift
//  VinoSwiftUI
//
//  Created by Renaud Pradenc on 29/04/2020.
//  Copyright © 2020 Céroce. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView([.horizontal, .vertical]) {
                RackView(bottleCount: .init(horizontal: 4, vertical: 3))
            }
            .background(
                Rectangle()
                    .foregroundColor(.gray)
            )
            .navigationBarTitle(Text("Cellar 1"), displayMode: .automatic)
            .navigationBarItems(trailing:
                Button(action: {},
                       label: {Text("Edit")}
                )
            )
        }
    }
}

struct Count2D {
    let horizontal: Int
    let vertical: Int
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
