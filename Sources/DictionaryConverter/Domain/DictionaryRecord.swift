//
//  DictionaryRecord.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

struct DictionaryRecord {
    let id: UUID
    let language: Language
    let text: String
    let partOfSpeech: PartOfSpeech
    let transcription: String
    let translations: [Translation]
}
