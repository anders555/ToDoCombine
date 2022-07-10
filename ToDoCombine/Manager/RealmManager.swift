//
//  RealmManager.swift
//  ToDoCombine
//
//  Created by Andrei Lashkevich on 03.07.2022.
//

import Foundation
import RealmSwift

final class RealmManager {
    private static let realm = try! Realm()
    
    static func read() -> [SavedTasks] {
        let result = realm.objects(SavedTasks.self)
        return Array(result)
    }
    
    static func save(object: SavedTasks) {
        try? realm.write {
            realm.add(object)
        }
    }
    
    static func delete(object: SavedTasks) {
        let data = read()
        guard let objectToDelete = data.filter({ $0.taskName == object.taskName && $0.taskDescription == object.taskDescription && $0.taskCategory == object.taskCategory && $0.taskDate == object.taskDate}).first else { return }
        
        try? realm.write({
            realm.delete(objectToDelete)
        })
    }
}
