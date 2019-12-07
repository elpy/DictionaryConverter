//
//  MongoExampleModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 07.12.2019.
//

import Foundation

struct MongoExampleModel: Codable {
    let text: String
    let translation: MongoExampleTranslationModel
}

extension MongoExampleModel {
    func normalize() -> Example {
        return Example(text: text, translation: translation.text, type: ExampleType.phrase)
    }
}

extension Array where Element == MongoExampleModel {
    func normalize() -> [Example] {
        var examples: [Example] = []
        
        for item in self {
            examples.append(item.normalize())
        }
        
        return examples
    }
}
