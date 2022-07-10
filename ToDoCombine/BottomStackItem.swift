//
//  BottomStackItem.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 09.06.2022.
//

import Foundation
class BottomStackItem {
    
    var title: String
    var image: String
    var isSelected: Bool
    
    init(title: String,
         image: String,
         isSelected: Bool = false) {
        self.title = title
        self.image = image
        self.isSelected = isSelected
    }
    
}
