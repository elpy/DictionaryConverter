//
//  DependencyContainer.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 06.12.2019.
//

import Foundation
import RealmSwift
import MongoSwift

// TODO: move these mongo constants somewhere nice
fileprivate let host = "localhost"
fileprivate let port = 27017
fileprivate let databaseName = "dictionaries"
fileprivate let engRusDictionaryName = "eng-rus"

// TODO: decide what to do with these ones
fileprivate let realmSchemeVersion: UInt64 = 1
fileprivate let realmOutput = "output"
fileprivate let realmDatabase = "eng-rus.dictionary.realm"

class DependencyContainer {
    
    // MARK: Methods
    
    init() {
        let realmDatabasePath = "\(FileManager.default.currentDirectoryPath)/\(realmOutput)/\(realmDatabase)"
        let config = Realm.Configuration(fileURL: URL(fileURLWithPath: realmDatabasePath), schemaVersion: realmSchemeVersion)
        Realm.Configuration.defaultConfiguration = config
    }
    
    func makeMongoDataStore() throws -> DictionaryDataStore {
        let client = try MongoClient("mongodb://\(host):\(port)")
        let db = client.db(databaseName)
        let colleaction = db.collection(engRusDictionaryName)
        
        return MongoDataStore(collection: colleaction)
    }
    
    func makeRealmDataStore() throws -> DictionaryDataStore {
        let output = "\(FileManager.default.currentDirectoryPath)/\(realmOutput)"
        
        if !FileManager.default.fileExists(atPath: output) {
            try FileManager.default.createDirectory(atPath: output, withIntermediateDirectories: false)
        }
        
        return RealmDataStore()
    }
    
    deinit {
        cleanupMongoSwift()
    }
    
}
