//
//  DependencyContainer.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 06.12.2019.
//

import Foundation
import MongoSwift

// TODO: move these constants somewhere nice
fileprivate let host = "localhost"
fileprivate let port = 27017
fileprivate let databaseName = "dictionaries"
fileprivate let engRusDictionaryName = "eng-rus"

class DependencyContainer {
    
    // MARK: Methods
    
    func makeMongoDataStore() throws -> DictionaryDataStore {
        let client = try MongoClient("mongodb://\(host):\(port)")
        let db = client.db(databaseName)
        let colleaction = db.collection(engRusDictionaryName)
        
        return MongoDataStore(collection: colleaction)
    }
    
    deinit {
        cleanupMongoSwift()
    }
    
}
