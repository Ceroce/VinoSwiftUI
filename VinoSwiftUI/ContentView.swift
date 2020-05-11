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
                Rack(bottleCount: .init(horizontal: 4, vertical: 3))
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

struct Rack: View {
    let bottleCount: Count2D
    let bottleSize = CGSize(width: 44, height: 44)
    var body: some View {
        VStack(spacing: 0) {
            HorizontalBoard()
            HStack(spacing: 0) {
                VerticalBoard()
                UnframedRack(bottleCount: bottleCount, bottleSize: bottleSize)
                VerticalBoard()
            }
            HorizontalBoard()
        }
    }
}

struct UnframedRack: View {
    let bottleCount: Count2D
    let bottleSize: CGSize
    
    var body: some View {
        VStack(spacing: 0) {
            Row(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
            HorizontalSeparator()
            Row(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
            HorizontalSeparator()
            Row(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
        }
    }
}

struct Row: View {
    let bottleCount: Int
    let bottleSize: CGSize
    
    // We must pass through an intermediary representation!
    struct Intermediary: Identifiable {
        enum Kind {
            case bottle
            case separator
        }
        let id = UUID()
        let kind: Kind
    }
    
    var bottles: [Bottle] {
        Array<Bottle>(repeatElement(Bottle(), count: bottleCount))
    }
    
    var intermediaries: AnyRandomAccessCollection<Intermediary> {
        AnyRandomAccessCollection(
            bottles.lazy.flatMap { _ in
                [Intermediary(kind: .bottle), Intermediary(kind: .separator)]
            }
            .dropLast()
        )
    }
    
    var body: some View {
        HStack(spacing: 0.0) {
            ForEach(intermediaries) { interm in
                // If…else works, but not switch…case !
                if interm.kind == .bottle {
                    BottleHole(size: self.bottleSize)
                } else {
                    VerticalSeparator(height: self.bottleSize.height)
                }
            }
        }
    }
}

struct BottleHole: View {
    let size: CGSize
    var body: some View {
        Rectangle()
            .frame(width: size.width, height: size.height, alignment: .center)
            .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 1, alpha: 0.3)))
    }
}

struct HorizontalSeparator: View {
    var body: some View {
        Rectangle()
            .frame(height: 4, alignment: .center)
        .foregroundColor(.red)
    }
}

struct VerticalSeparator: View {
    let height: CGFloat
    static let width: CGFloat = 4
    var body: some View {
        Rectangle()
            .frame(width: Self.width, height: height, alignment: .center)
        .foregroundColor(.purple)
    }
}

struct HorizontalBoard: View {
    var body: some View {
        Rectangle()
            .frame(height: 6, alignment: .center)
        .foregroundColor(.yellow)
    }
}

struct VerticalBoard: View {
    var body: some View {
        Rectangle()
            .frame(width: 6, alignment: .center)
            .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
