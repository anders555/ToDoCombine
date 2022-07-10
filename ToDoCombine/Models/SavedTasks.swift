//
//  Tasks.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 16.06.2022.
//

import RealmSwift

@objc final class SavedTasks: Object {
    @objc dynamic var taskName          = ""
    @objc dynamic var taskDescription   = ""
    @objc dynamic var taskCategory      = ""
    @objc dynamic var taskDate          = ""
    
}


