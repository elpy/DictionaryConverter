//
//  RealmDictionaryRecordModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 08.12.2019.
//

import Foundation
import RealmSwift

class RealmDictionaryRecordModel: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var text: String = ""
    @objc dynamic var partOfSpeech: String = ""
    @objc dynamic var transcription: String = ""
    let translations: List<RealmTranslationModel> = List()
}

extension RealmDictionaryRecordModel {
    convenience init(record: DictionaryRecord) {
        self.init()
        
        id = record.id.uuidString
        language = record.language.rawValue
        text = record.text
        partOfSpeech = record.partOfSpeech.rawValue
        transcription = record.transcription
        
        for translation in record.translations {
            translations.append(RealmTranslationModel(translation: translation))
        }
    }
}
