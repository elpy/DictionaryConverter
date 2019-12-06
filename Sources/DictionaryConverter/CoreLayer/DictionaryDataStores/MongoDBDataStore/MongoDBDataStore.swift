//
//  MongoDBDataStore.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation
import MongoSwift

class MongoDBDataStore: DictionaryDataStore {
    
    // MARK: properties
    
    private let collection: MongoCollection<Document>
    
    
    // MARK: methods

    init(collection: MongoCollection<Document>) {
        self.collection = collection
    }
    
    func get() throws -> [DictionaryRecord] {
        let documents = try collection.find()
        
        let records: [DictionaryRecord] = try documents.map { document in
            let recordOrNil = convertDocument(document)
            
            if let record = recordOrNil {
                return record
            } else {
                throw DataStoreError.convertError("Couldn't process a document: \(document).")
            }
        }
        
        return records
    }
    
    func add(records: [DictionaryRecord]) throws -> Void {
        throw DataStoreError.notSupported("Adding documents to mongodb collection is currently not supported")
    }
    
}


/*
// Connecting to a dictionaries server
let client = try MongoClient("mongodb://\(host):\(port)")
let db = client.db(databaseName)

// Selecting a dictionary that we want to convert
let dictionary = db.collection(engRusDictionaryName)

// Iterating over all documents and convert each one to a realm model
let documents = try dictionary.find()

for document in documents {
    print(document["id"])
}

if let error = documents.error {
    print(error)
}
*/
