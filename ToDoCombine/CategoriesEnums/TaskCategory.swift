//
//  TaskCategory.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 03.07.2022.
//

import Foundation
enum TaskCategory: String, CaseIterable {
    case important       = "Важное"
    case purchase        = "Покупки"
    case activity        = "Активности"
    case health          = "Здоровье"
    case learning        = "Изучение"
}

//class TaskCategory {
//    var important       = "Важное"
//    var purchase        = "Покупки"
//    var activity        = "Активности"
//    var health          = "Здоровье"
//    var learning        = "Изучение"
//    
//    init(important: String, purchase: String,activity: String, health: String, learning: String){
//        self.important = important
//        self.purchase = purchase
//        self.activity = activity
//        self.health = health
//        self.learning = learning
//    }
//}
