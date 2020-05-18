//
//  Category.swift
//  Lists
//
//  Created by Javier Fernández on 14/05/2020.
//  Copyright © 2020 Silversun Studio. All rights reserved.
//

import Foundation

struct Category: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var description: String = ""
    var feature: Bool = false
}
