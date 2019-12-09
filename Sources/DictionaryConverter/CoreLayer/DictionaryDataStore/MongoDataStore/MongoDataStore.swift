//
//  MongoDBDataStore.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation
import MongoSwift

class MongoDataStore: DictionaryDataStore {
    
    // MARK: properties
    
    private let collection: MongoCollection<Document>
    
    
    // MARK: methods

    init(collection: MongoCollection<Document>) {
        self.collection = collection
    }
    
    func get() throws -> [DictionaryRecord] {
        let documents = try collection.find()
        let records: [DictionaryRecord] = try documents.map { document in
            let model = try BSONDecoder().decode(MongoDictionaryRecordModel.self, from: document)
            return model.normalize()
        }
        
        return records
    }
    
    func add(records: [DictionaryRecord]) throws -> Void {
        throw DataStoreError.notSupported("Adding documents to mongodb collection is currently not supported")
    }
    
}
