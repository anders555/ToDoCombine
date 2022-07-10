//
//  AddTaskVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 16.06.2022.
//

import UIKit
import FSCalendar

class AddTaskVC: UIViewController {
    @IBOutlet weak var taskInput: UITextField!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    var strDate = ""
    var testDate = Date()
    var savedCategoryColor: UIColor = UIColor()
    
//    weak var dateDelegate: SetDateForTaskDelegate?
    
//    weak var categoryColorDelegate: SetTaskCategoryColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupLabelTap()
        datePicker.date = testDate
//        self.dateLabel.text  = formatter.string(from:testDate)

    }
    
//    func changeColorCategory() {
//        if TaskCategory.RawValue == TaskCategory.health {
//            categoryLabel.textColor = UIColor.systemBlue
//        }
//    }
    
    
    func setupLabelTap() {
        
        let labelTap = UITapGestureRecognizer(target: self, action: #selector(self.labelTapped(_:)))
        self.categoryLabel.isUserInteractionEnabled = true
        self.categoryLabel.addGestureRecognizer(labelTap)
    }
    
    @objc func labelTapped(_ sender: UITapGestureRecognizer) {
        let taskCategoryViewController = TaskCategoryVC(nibName: String(describing: TaskCategoryVC.self), bundle: nil)
        
        //MARK: WORKED DELEGATE
        taskCategoryViewController.categoryDelegate = self
        self.present(taskCategoryViewController, animated: true)
//        categoryColorDelegate?.saveCategoryColor(savedCategoryColor)
    }
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        strDate = dateFormatter.string(from: datePicker.date)
    }
    
    @IBAction func saveAction(_ sender: Any) {


        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM YY"
        
//        dateFormatter.dateStyle = DateFormatter.Style.short
        let newTask = SavedTasks()
        newTask.taskName = taskInput.text!
        newTask.taskDescription = descriptionInput.text!
        newTask.taskCategory = categoryLabel.text!
        newTask.taskDate = dateFormatter.string(from: testDate)
        RealmManager.save(object: newTask)
//        categoryLabel.textColor = .red
        
        navigationController?.popViewController(animated: true)


    }
}



extension AddTaskVC: SetTaskCategory {
    func addTaskCategory(_ taskCategory: TaskCategory, categoryColor: UIColor) {
        categoryLabel.text = taskCategory.rawValue
        savedCategoryColor = categoryColor
        categoryLabel.textColor = savedCategoryColor
        print(savedCategoryColor)
        print(UIColor(cgColor: savedCategoryColor.cgColor))
    }
    
//    func addTaskCategory(_ taskCategory: TaskCategory) {
//        categoryLabel.text = taskCategory.rawValue
////        print(taskCategory)
//
//    }
}
