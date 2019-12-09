//
//  MongoTranslationModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 07.12.2019.
//

import Foundation

struct MongoTranslationModel: Codable {
    let text: String
    let related_entries: [String]
    let synonyms: [MongoSynonymModel]
    let examples: [MongoExampleModel]
}

extension MongoTranslationModel {
    func normalize() -> Translation {
        return Translation(
            text: text,
            relatedRecords: related_entries,
            synonyms: synonyms.normalize(),
            examples: examples.normalize()
        )
    }
}

extension Array where Element == MongoTranslationModel {
    func normalize() -> [Translation] {
        var translations: [Translation] = []
        
        for item in self {
            translations.append(item.normalize())
        }
        
        return translations
    }
}
