//
//  StorageManager.swift
//  My plases
//
//  Created by liza on 21/10/2019.
//  Copyright © 2019 liza. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManader {
    static func saveObject(_ place: Place){
        try! realm.write {
            realm.add(place)
        }
    }
    
    static func deleteObject (_ place: Place){
        try! realm.write {
            realm.delete(place)
        }
    }
}
