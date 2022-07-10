//
//  Updatable.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 16.06.2022.
//

import Foundation
import UIKit

protocol Updatable: AnyObject {
    func addTask(_ task: SavedTasks)
}

//MARK: Set Delegate for transfer data to AddVC
protocol SetDateForTaskDelegate: AnyObject {
    func didTapEnabled(_ date: Date)
}

protocol SetTaskCategory: AnyObject {
    func addTaskCategory(_ taskCategory: TaskCategory, categoryColor: UIColor)
    
}

protocol SetTaskCategoryColor: AnyObject {
    func saveCategoryColor(_ categoryColor: UIColor)
    
}

protocol PassNewsData: AnyObject {
    func passNews(title: String, description: String)
    
}
