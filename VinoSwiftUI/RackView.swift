//
//  RackView.swift
//  VinoSwiftUI
//
//  Created by Renaud Pradenc on 11/05/2020.
//  Copyright © 2020 Céroce. All rights reserved.
//

import Foundation
import SwiftUI


struct RackView: View {
    let bottleCount: Count2D
    let bottleSize = CGSize(width: 44, height: 44)
    var body: some View {
        VStack(spacing: 0) {
            HorizontalBoardView()
            HStack(spacing: 0) {
                VerticalBoardView()
                UnframedRackView(bottleCount: bottleCount, bottleSize: bottleSize)
                VerticalBoardView()
            }
            HorizontalBoardView()
        }
    }
}

struct UnframedRackView: View {
    let bottleCount: Count2D
    let bottleSize: CGSize
    
    var body: some View {
        VStack(spacing: 0) {
            RowView(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
            HorizontalSeparatorView()
            RowView(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
            HorizontalSeparatorView()
            RowView(bottleCount: bottleCount.horizontal, bottleSize: bottleSize)
        }
    }
}

struct RowView: View {
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
                    BottleHoleView(size: self.bottleSize)
                } else {
                    VerticalSeparatorView(height: self.bottleSize.height)
                }
            }
        }
    }
}

struct BottleHoleView: View {
    let size: CGSize
    var body: some View {
        Rectangle()
            .frame(width: size.width, height: size.height, alignment: .center)
            .foregroundColor(Color(UIColor(red: 0, green: 0, blue: 1, alpha: 0.3)))
    }
}

struct HorizontalSeparatorView: View {
    var body: some View {
        Rectangle()
            .frame(height: 4, alignment: .center)
        .foregroundColor(.red)
    }
}

struct VerticalSeparatorView: View {
    let height: CGFloat
    static let width: CGFloat = 4
    var body: some View {
        Rectangle()
            .frame(width: Self.width, height: height, alignment: .center)
        .foregroundColor(.purple)
    }
}

struct HorizontalBoardView: View {
    var body: some View {
        Rectangle()
            .frame(height: 6, alignment: .center)
        .foregroundColor(.yellow)
    }
}

struct VerticalBoardView: View {
    var body: some View {
        Rectangle()
            .frame(width: 6, alignment: .center)
            .foregroundColor(.green)
    }
}

public enum RackViewPreview: PreviewProvider {
    
    public static var previews: some View {
        RackView(bottleCount: Count2D(horizontal: 4, vertical: 3))
        .fixedSize()
    }
}
