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
        HStack {
            Spacer()
//                .frame(height: 0.0)
            VStack {
                Spacer()
//                    .frame(width: 0.0)
                Rack()
                Spacer()
//                    .frame(width: 0.0)
            }
            Spacer()
//                .frame(height: 0.0)
        }
        
    }
}

struct Rack: View {
    let bottleSize = CGSize(width: 44, height: 44)
    var body: some View {
        VStack(spacing: 0) {
            HorizontalBoard()
            HStack(spacing: 0) {
                VerticalBoard()
                VStack(spacing: 0) {
                    Row(bottleHoleSize: bottleSize)
                    HorizontalSeparator()
                    Row(bottleHoleSize: bottleSize)
                    HorizontalSeparator()
                    Row(bottleHoleSize: bottleSize)
                }
                VerticalBoard()
            }
            HorizontalBoard()
        }
    }
}

struct Row: View {
    let bottleHoleSize: CGSize
    var body: some View {
        HStack(spacing: 0.0) {
            BottleHole(size: bottleHoleSize)
            VerticalSeparator(height: bottleHoleSize.height)
            BottleHole(size: bottleHoleSize)
            VerticalSeparator(height: bottleHoleSize.height)
            BottleHole(size: bottleHoleSize)
            VerticalSeparator(height: bottleHoleSize.height)
            BottleHole(size: bottleHoleSize)
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
    let height: CGFloat = 4
    var body: some View {
        Rectangle()
            .frame(height: height, alignment: .center)
        .foregroundColor(.red)
    }
}

struct VerticalSeparator: View {
    let height: CGFloat
    let width: CGFloat = 4
    var body: some View {
        Rectangle()
            .frame(width: width, height: height, alignment: .center)
        .foregroundColor(.purple)
    }
}

struct HorizontalBoard: View {
    let height: CGFloat = 6
    var body: some View {
        Rectangle()
            .frame(height: height, alignment: .center)
        .foregroundColor(.yellow)
    }
}

struct VerticalBoard: View {
    let width: CGFloat = 6
    var body: some View {
        Rectangle()
            .frame(width: width, alignment: .center)
            .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
