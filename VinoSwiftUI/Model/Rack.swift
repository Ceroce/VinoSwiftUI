//
//  Rack.swift
//  VinoSwiftUI
//
//  Created by Renaud Pradenc on 11/05/2020.
//  Copyright © 2020 Céroce. All rights reserved.
//

import Foundation

class Rack {
    struct Capacity {
        let horizontal: Int
        let vertical: Int
        let count: Int
        init(horizontal: Int, vertical: Int) {
            assert(horizontal >= 1)
            assert(vertical >= 1)
            self.horizontal = horizontal
            self.vertical = vertical
            self.count = horizontal*vertical
        }
    }
    
    let capacity: Capacity
    init(capacity: Capacity) {
        self.capacity = capacity
        self.bottles = Array(repeating: nil, count: capacity.count)
    }
    
    let bottles: [Bottle?]
    
    var bottlesAsRows: [ArraySlice<Bottle?>] {
        let rowIndexes = 0..<capacity.vertical
        return rowIndexes.map { bottlesInRow($0) }
    }
    func bottlesInRow(_ row: Int) -> ArraySlice<Bottle?> {
        assert(row < capacity.vertical)
        let startIndex = capacity.horizontal * row
        return bottles[startIndex..<startIndex+capacity.horizontal]
    }
    
    func bottleIndexFor(x: Int, y: Int) -> Int {
        assert(x >= 0 && x < capacity.horizontal)
        assert(y >= 0 && y < capacity.vertical)
        return y*capacity.horizontal + x
    }
    
    func bottleXYFor(index: Int) -> (Int, Int) {
        assert(index >= 0)
        return (index % capacity.horizontal, index / capacity.horizontal)
    }
}

// As-ton besoin de BottleRow ? Est-ce que ça marcherait avec tous les types de casier ?
