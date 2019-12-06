//
//  MongoDBDictionaryRecord.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation
import MongoSwift

extension MongoDBDataStore {
    func convertDocument(_ document: Document) -> DictionaryRecord? {
        return MongoDBDocument(document: document)
    }
}

extension Document {
    func getValue<T>(for field: String) -> T? {
        let bsonValueOrNil = self[field]
        
        guard let bsonValue = bsonValueOrNil, let value = bsonValue as? T else {
            return nil
        }
        
        return value
    }
}

fileprivate struct MongoDBDocument: DictionaryRecord {
    let id: UUID
    let language: Language
    let text: String
    let partOfSpeech: PartOfSpeech
    let transcription: String
    let translations: [Translation]
}

extension MongoDBDocument {
    init?(document: Document) {
        guard
            let identifier: String = document.getValue(for: "id"),
            let uuid = UUID.init(uuidString: identifier),
            let text: String = document.getValue(for: "text"),
            let partOfSpeech: String = document.getValue(for: "partOfSpeech"),
            let transcription: String = document.getValue(for: "transcription"),
            let array: [BSONValue] = document.getValue(for: "translations"),
            array.count > 0
        else { return nil }
        
        var translations: [Translation] = []
        for item in array {
            guard let translation = MongoDBTranslation(bson: item) else { return nil }
            
            translations.append(translation)
        }
                
        self = MongoDBDocument(
            id: uuid,
            language: Language.ENG,
            text: text,
            partOfSpeech: PartOfSpeech(text: partOfSpeech),
            transcription: transcription,
            translations: translations
        )
    }
}

fileprivate struct MongoDBTranslation: Translation {
    let text: String
    let relatedRecords: [String]
    let synonyms: [Synonym]
    let examples: [Example]
}

extension MongoDBTranslation {
    init?(bson: BSONValue) {
        guard
            let document = bson as? Document,
            let text: String = document.getValue(for: "text"),
            let synonymsArray: [BSONValue] = document.getValue(for: "synonyms"),
            let relatedRecords: [String] = document.getValue(for: "related_entries"),
            let examplesArray: [BSONValue] = document.getValue(for: "examples")
        else { return nil }

        var synonyms: [Synonym] = []
        for item in synonymsArray {
            guard let synonym = MongoDBSynonym(bson: item) else { return nil }
            
            synonyms.append(synonym)
        }
        
        var examples: [Example] = []
        for item in examplesArray {
            guard let example = MongoDBExample(bson: item) else { return nil }
            
            examples.append(example)
        }
        
        self = MongoDBTranslation(
            text: text,
            relatedRecords: relatedRecords,
            synonyms: synonyms,
            examples: examples
        )
    }
}


fileprivate struct MongoDBSynonym: Synonym {
    let text: String
    let partOfSpeech: PartOfSpeech
}

extension MongoDBSynonym {
    init?(bson: BSONValue) {
        guard
            let document = bson as? Document,
            let text: String = document.getValue(for: "text"),
            let partOfSpeech: String = document.getValue(for: "partOfSpeech")
        else { return nil }
        
        self = MongoDBSynonym(text: text, partOfSpeech: PartOfSpeech(text: partOfSpeech))
    }
}

fileprivate struct MongoDBExample: Example {
    let text: String
    let translation: String
    let type: ExampleType
}

extension MongoDBExample {
    init?(bson: BSONValue) {
        guard
            let document = bson as? Document,
            let text: String = document.getValue(for: "text"),
            let translationDocument: Document = document.getValue(for: "translation"),
            let translation: String = translationDocument.getValue(for: "text")
        else { return nil }
        
        self = MongoDBExample(text: text, translation: translation, type: ExampleType.phrase)
    }
}



