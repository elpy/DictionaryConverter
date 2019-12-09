//
//  MongoDictionaryRecordModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 07.12.2019.
//

import Foundation

struct MongoDictionaryRecordModel: Codable {
    let id: String
    let text: String
    let partOfSpeech: String
    let transcription: String
    let translations: [MongoTranslationModel]
}

extension MongoDictionaryRecordModel {
    func normalize() -> DictionaryRecord {        
        return DictionaryRecord(
            id: UUID(uuidString: id)!,
            language: Language.ENG, // TODO: replace with actual value
            text: text,
            partOfSpeech: PartOfSpeech(text: partOfSpeech),
            transcription: transcription,
            translations: translations.normalize()
        )
    }
}
