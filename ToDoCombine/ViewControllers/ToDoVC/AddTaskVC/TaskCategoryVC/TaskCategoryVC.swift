//
//  TaskCategoryVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 04.07.2022.
//

import UIKit

class TaskCategoryVC: UIViewController {

    var taskCategory = TaskCategory.allCases
    var importantCategory = TaskCategory.important
    var purchasesCategory = TaskCategory.purchase
    var activityCategory = TaskCategory.activity
    var healthCategory = TaskCategory.health
    var learningCategory = TaskCategory.learning
    


    
    weak var categoryDelegate: SetTaskCategory?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
//    func setupSetur(task: SavedTasks){
//        timeLabel.text = task.taskDate
//        descriptionLabel.text = task.taskDescription
//        taskLabel.text = task.taskName
//        categoryLabel.text = task.taskCategory
//        selectionStyle = .none
//        }
    @IBAction func importantCategoryBtn(_ sender: Any) {
        categoryDelegate?.addTaskCategory(importantCategory, categoryColor: .red)
        self.dismiss(animated: true)
    
    }
    @IBAction func purchasestCategoryBtn(_ sender: Any) {
        categoryDelegate?.addTaskCategory(purchasesCategory, categoryColor: .cyan)
        self.dismiss(animated: true)

    }
//    @IBAction func activityCategoryBtn(_ sender: Any) {
//        categoryDelegate?.addTaskCategory(activityCategory)
//        self.dismiss(animated: true)
//
//    }
//    @IBAction func healthtCategoryBtn(_ sender: Any) {
//        categoryDelegate?.addTaskCategory(healthCategory)
//        self.dismiss(animated: true)
//
//    }
//    @IBAction func learningCategoryBtn(_ sender: Any) {
//        categoryDelegate?.addTaskCategory(learningCategory)
//        self.dismiss(animated: true)
//
//    }
    
}

