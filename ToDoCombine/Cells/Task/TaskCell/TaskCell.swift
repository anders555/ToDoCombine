//
//  TaskCell.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 16.06.2022.
//

import UIKit

class TaskCell: UITableViewCell {

    
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    var savedCategoryColor: UIColor = UIColor()
    func setupSetur(task: SavedTasks){
        timeLabel.text = "Задача на \(task.taskDate) года"
        descriptionLabel.text = task.taskDescription
        taskLabel.text = task.taskName
        if task.taskCategory == "" {
            categoryLabel.text = "Категория не выбрана"
        } else {
            categoryLabel.text = task.taskCategory
        }
//        categoryLabel.text = task.taskCategory
//        categoryLabel.textColor = .brown
        selectionStyle = .none
        }
}

extension TaskCell: SetTaskCategory{
    func addTaskCategory(_ taskCategory: TaskCategory, categoryColor: UIColor) {
//        categoryLabel.text = taskCategory.rawValue
//        savedCategoryColor = categoryColor
        savedCategoryColor = categoryColor
        categoryLabel.tintColor = savedCategoryColor
        print(savedCategoryColor)
    }
    
//    func saveCategoryColor(_ categoryColor: UIColor) {
//        categoryLabel.textColor = UIColor(cgColor: categoryColor.cgColor)
//    }
}
