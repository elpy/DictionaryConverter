//
//  DictionaryRecord.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

protocol DictionaryRecord {
    var id: UUID { get }
    var language: Language { get }
    var text: String { get }
    var partOfSpeech: PartOfSpeech { get }
    var transcription: String { get }
    var translations: [Translation] { get }
}
