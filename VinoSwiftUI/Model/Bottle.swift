//
//  Model.swift
//  VinoSwiftUI
//
//  Created by Renaud Pradenc on 06/05/2020.
//  Copyright © 2020 Céroce. All rights reserved.
//

import Foundation

struct Bottle: Identifiable {
    enum Color {
        case red
        case rosy
        case white
    }
    
    let id = UUID()
}
