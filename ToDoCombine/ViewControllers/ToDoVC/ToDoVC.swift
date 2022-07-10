//
//  ToDoVC.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 08.06.2022.
//

import UIKit
import FSCalendar
import RealmSwift


class ToDoVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendarView: FSCalendar!
    @IBOutlet weak var helloTitle: UILabel!
    
    var history = RealmManager.read() {
        didSet {
            tableView.reloadData()
        }
    }
    
//    let realmObj = Realm.self
//    let predicate = NSPredicate(format: "Start >= %@ AND End <= %@", start,end)
//    let results = realmObj.objects(SavedTasks.self).filter(predicate)
    
    
    var calendar: FSCalendar!
    var formatter = DateFormatter()
    var transferredDate = Date()
    var datesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Ближайшие задачи"
//                navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: String(describing: TaskCell.self), bundle: nil), forCellReuseIdentifier: String(describing: TaskCell.self))
        
        calendarView.delegate = self
        calendarView.dataSource = self
        setCalendarInterface()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        history = RealmManager.read()
        if history.isEmpty {
            helloTitle.text = "Вы ещё не добавили задачи. Для добавления нужно тапнуть по нужной вам дате)"
        } else {
            helloTitle.isHidden = true
        }
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        history = RealmManager.read()
//        if history.isEmpty {
//            helloTitle.text = "Вы ещё не добавили задачи. Для добавления нужно тапнуть по нужной вам дате)"
//        } else {
//            helloTitle.isHidden = true
//        }
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        history = RealmManager.read()
//    }
    func setDots(task: SavedTasks){
//        for i in task{
//            
//        }
            datesArray.append(task.taskDate)
        print("!!\(datesArray.count)")
    }
    
    func setCalendarInterface() {
        calendarView.appearance.titleFont = UIFont.systemFont(ofSize: 15)
        calendarView.firstWeekday = 2
        calendarView.appearance.headerDateFormat = "MMMM yyyy"
        calendarView.locale = Locale(identifier: "ru_RU")
        let mounthArray = [calendarView.gregorian.monthSymbols]
        
        print("11111\(calendarView.gregorian.monthSymbols)")
        print("11111\(mounthArray.count)")
        calendarView.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 17)
        calendarView.appearance.todayColor = .systemTeal.withAlphaComponent(0.7)
        calendarView.appearance.titleTodayColor = .white
        calendarView.appearance.titleDefaultColor = .white.withAlphaComponent(0.9)
        calendarView.appearance.headerTitleColor = .systemTeal.withAlphaComponent(0.9)
        calendarView.appearance.weekdayTextColor = .white.withAlphaComponent(0.9)
        
        //        calendar.calendarHeaderView.backgroundColor = UIColor.lightGray
        //        calendar.calendarWeekdayView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
    }
    
    
    
    
}
extension ToDoVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TaskCell.self), for: indexPath) as! TaskCell
        cell.setupSetur(task: history[indexPath.row])
        setDots(task: history[indexPath.row])
        return cell
        tableView.reloadData()
    }
//
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
//
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCell.EditingStyle, forRowAtIndexPath indexPath: IndexPath) {
//        if (editingStyle == .delete) {
//            RealmManager.delete(object: self.history[indexPath.row])
//            self.history = RealmManager.read()
//            tableView.reloadData()
//        }
//    }
    
}

extension ToDoVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "Удаление", message: "Действительно удалить задачу", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Нет", style: .cancel)
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
            RealmManager.delete(object: self.history[indexPath.row])
            self.history = RealmManager.read()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(deleteAction)
        present(alert, animated: true)
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            RealmManager.delete(object: self.history[indexPath.row])
            self.history = RealmManager.read()
            tableView.reloadData()
        }
    }
}

extension ToDoVC: FSCalendarDelegate,FSCalendarDataSource, FSCalendarDelegateAppearance{
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd MMM YYYY"
        let stringDate  = formatter.string(from: date)
        transferredDate = date
//        print("\(stringDate)")
        
        let addVC = AddTaskVC(nibName: String(describing: AddTaskVC.self), bundle: nil)
        navigationController?.pushViewController(addVC, animated: true)
        //        self.present(addVC, animated: true)
        tableView.reloadData()
        //        addVC.dateDelegate = self
        
        print(stringDate)
        
        addVC.testDate = date
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }

    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at monthPosition: FSCalendarMonthPosition) {
       let dateFormatter3 = DateFormatter()
       dateFormatter3.dateFormat = "yyyy-MM-dd"
       let dateString = dateFormatter3.string(from: date)
       cell.eventIndicator.isHidden = false
       cell.eventIndicator.color = UIColor.blue

       if self.datesArray.contains(dateString){
           cell.eventIndicator.numberOfEvents = 1
       }
   }
    
//    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
//        let dateString2 = self.dateFormatter2.string(from: date)
//
//    }
//    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, eventDefaultColorsFor date: Date) -> [UIColor]? {
//
//        let dateString = date.toString(dateFormat: "yyyy-MM-dd")
//        if self. .contains(dateString!) {
//            return [UIColor.blue]
//        }
//        return [UIColor.white]
//    }
}




//extension ToDoVC: SetDateForTaskDelegate {
//    func didTapEnabled(_ date: Date) {
//        //        datePicker.date = date
//        //        //MARK: DOESN'T WORK
//    }
//}





func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
    let cell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
    return cell
}
//
//    func calendar(_ calendar: FSCalendar, willDisplay cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
//        self.configure(cell: cell, for: date, at: position)
//    }
//
//    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
//        return nil
//    }

//    private func configure(cell: FSCalendarCell, for date: Date, at position: FSCalendarMonthPosition) {
//
//        guard let diyCell = (cell as? DateCalendarCell) else {return}
//        diyCell.circleImageView.isHidden = true
//        if position == .current {
//            var selectionType = SelectionType.none
//            if calendar.selectedDates.count == 2 {
//                var first = calendar.selectedDates[0]
//                var second = calendar.selectedDates[1]
//                if second <= first {
//                    let temp = first
//                    first = second
//                    second = temp
//                }
//                if date == first {
//                    selectionType = .leftBorder
//                } else if date == second {
//                    selectionType = .rightBorder
//                } else if date >= first && date <= second {
//                    selectionType = .middle
//                }
//            } else {
//                if calendar.selectedDates.contains(date) {
//                    if calendar.selectedDates.count == 1 {
//                        selectionType = .single
//                    } else {
//                        selectionType = .none
//                    }
//                } else {
//                    selectionType = .none
//                }
//            }
//            diyCell.selectionLayer.isHidden = false
//            diyCell.selectionType = selectionType
//        } else {
//            diyCell.selectionLayer.isHidden = true
//            diyCell.titleLabel.textColor = Defined.reuColor
//        }
//    }


//    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
//        let cell: FSCalendarCell = calendar.dequeueReusableCell(withIdentifier: "cell", for: date, at: position)
//        let dateFromStringFormatter = DateFormatter();
//        dateFromStringFormatter.dateFormat = "YYYY-MM-dd";
//        let calendarDate = dateFromStringFormatter.string(from: date)
//        return cell
//    }

//    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
//        return tasks[IndexPath.row].task
//    }

