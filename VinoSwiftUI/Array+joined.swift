//
//  Array+joined.swift
//  VinoSwiftUI
//
//  Created by Renaud Pradenc on 06/05/2020.
//  Copyright © 2020 Céroce. All rights reserved.
//

extension Array {
    /// Returns an array containing the elements of the array joined by a separator.
    func joined(by separator:Element) -> Array<Element> {
        guard let lastElement = self.last else {
            return []
        }
        guard self.count > 1 else {
            return self
        }
        
        var joinedElements = Array<Element>()
        let butLast = self.prefix(self.count-1)
        for element in butLast {
            joinedElements.append(element)
            joinedElements.append(separator)
        }
        joinedElements.append(lastElement)
        
        return joinedElements
    }
}
