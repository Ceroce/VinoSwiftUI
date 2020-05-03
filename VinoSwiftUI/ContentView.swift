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
            VStack {
                Spacer()
                Rack()
                Spacer()
            }
            Spacer()
        }
        
    }
}

struct Rack: View {
    let bottleSize = CGSize(width: 44, height: 44)
    var body: some View {
        let unframedSize = UnframedRack.size(bottleSize: bottleSize)
        let width = unframedSize.width + 2*VerticalBoard.width
        return VStack(spacing: 0) {
            HorizontalBoard(width: width)
            HStack(spacing: 0) {
                VerticalBoard(height: unframedSize.height)
                UnframedRack(bottleSize: bottleSize)
                VerticalBoard(height: unframedSize.height)
            }
            HorizontalBoard(width: width)
        }
    }
}

struct UnframedRack: View {
    let bottleSize: CGSize
    var body: some View {
        let rowWidth = Row.size(bottleSize: bottleSize).width
        return VStack(spacing: 0) {
            Row(bottleHoleSize: bottleSize)
            HorizontalSeparator(width: rowWidth)
            Row(bottleHoleSize: bottleSize)
            HorizontalSeparator(width: rowWidth)
            Row(bottleHoleSize: bottleSize)
        }
    }
    
    static func size(bottleSize: CGSize) -> CGSize {
        let rowSize = Row.size(bottleSize: bottleSize)
        return CGSize(width: rowSize.width, height: 3*rowSize.height + 2*HorizontalSeparator.height)
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
    
    static func size(bottleSize: CGSize) -> CGSize {
        .init(width: 4 * bottleSize.width + 3 * VerticalSeparator.width, height: bottleSize.height)
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
    let width: CGFloat
    static let height: CGFloat = 4
    var body: some View {
        Rectangle()
            .frame(width: width, height: Self.height, alignment: .center)
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
    let width: CGFloat
    static let height: CGFloat = 6
    var body: some View {
        Rectangle()
            .frame(width: width, height: Self.height, alignment: .center)
        .foregroundColor(.yellow)
    }
}

struct VerticalBoard: View {
    static let width: CGFloat = 6
    let height: CGFloat
    var body: some View {
        Rectangle()
            .frame(width: Self.width, height: height, alignment: .center)
            .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
