//
//  RealmDataStore.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 08.12.2019.
//

import Foundation
import RealmSwift

class RealmDataStore: DictionaryDataStore {
    
    // MARK: methods
    
    func get() throws -> [DictionaryRecord] {
        throw DataStoreError.notSupported("Retrieving documents from realm collection is currently not supported")
    }
    
    func add(records: [DictionaryRecord]) throws -> Void {
        let models = records.map { RealmDictionaryRecordModel(record: $0) }
        
        let realm = try Realm()
        try realm.write {
            realm.add(models)
        }
    }
    
}
