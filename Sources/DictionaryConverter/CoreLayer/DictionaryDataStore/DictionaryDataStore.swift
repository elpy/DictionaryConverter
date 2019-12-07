//
//  DictionaryDataStore.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 02.12.2019.
//

import Foundation

protocol DictionaryDataStore {
    func get() throws -> [DictionaryRecord]
    func add(records: [DictionaryRecord]) throws -> Void
}

enum DataStoreError: Error {
    case notSupported(String)
    case convertError(String)
}
