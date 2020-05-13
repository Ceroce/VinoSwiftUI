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
    let rack: Rack
    var body: some View {
        VStack(spacing: 0) {
            HorizontalBoardView()
            HStack(spacing: 0) {
                VerticalBoardView()
                UnframedRackView(rack: rack)
                VerticalBoardView()
            }
            HorizontalBoardView()
        }
    }
}

struct UnframedRackView: View {
    let rack: Rack
    
    struct Intermediary: Identifiable {
        enum Kind {
            case row ([Bottle?])
            case separator
        }
        let id = UUID()
        let kind: Kind
        
        var row: [Bottle?]? {
            switch self.kind {
            case .row (let bottles):
                return bottles
            case .separator:
                return nil
            }
        }
    }
    
    var intermediaries: AnyRandomAccessCollection<Intermediary> {
        AnyRandomAccessCollection(
            rack.bottlesAsRows.map { Intermediary(kind: .row(Array($0))) }
                .joined(by: Intermediary(kind: .separator))
        )
    }
    
    var body: some View {
        return VStack(spacing: 0) {
            ForEach(intermediaries) { interm in
                if interm.row != nil {
                    RowView(bottles: interm.row!)
                } else {
                    HorizontalSeparatorView()
                }
            }
        }
    }
}

struct RowView: View {
    let bottles: [Bottle?]
    
    // We must pass through an intermediary representation!
    struct Intermediary: Identifiable {
        enum Kind {
            case bottle
            case separator
        }
        let id = UUID()
        let kind: Kind
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
        HStack(spacing: 0) {
            ForEach(intermediaries) { interm in
                // If…else works, but not switch…case !
                if interm.kind == .bottle {
                    BottleHoleView()
                } else {
                    VerticalSeparatorView()
                }
            }
        }
    }
}

struct BottleHoleView: View {
    var body: some View {
        Rectangle()
            .frame(width: 44, height: 44, alignment: .center)
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
    var body: some View {
        Rectangle()
            .frame(width: 4, alignment: .center)
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
        RackView(rack: Rack(capacity: .init(horizontal: 6, vertical: 3)))
        .fixedSize()
    }
}
