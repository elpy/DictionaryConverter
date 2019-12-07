//
//  MongoSynonymModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 07.12.2019.
//

import Foundation

struct MongoSynonymModel: Codable {
    let text: String
    let partOfSpeech: String
}

extension MongoSynonymModel {
    func normalize() -> Synonym {
        return Synonym(text: text, partOfSpeech: PartOfSpeech(text: partOfSpeech))
    }
}

extension Array where Element == MongoSynonymModel {
    func normalize() -> [Synonym] {
        var synonyms: [Synonym] = []
        
        for item in self {
            synonyms.append(item.normalize())
        }
        
        return synonyms
    }
}
