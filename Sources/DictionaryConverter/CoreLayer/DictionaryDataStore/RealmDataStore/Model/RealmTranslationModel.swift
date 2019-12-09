//
//  RealmTranslationModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 08.12.2019.
//

import Foundation
import RealmSwift

class RealmTranslationModel: Object {
    @objc dynamic var text: String = ""
    let synonyms: List<RealmSynonymModel> = List()
    let relatedRecords: List<String> = List()
    let examples: List<RealmExampleModel> = List()
}

extension RealmTranslationModel {
    convenience init(translation: Translation) {
        self.init()
        
        text = translation.text
        relatedRecords.append(objectsIn: translation.relatedRecords)

        for synonym in translation.synonyms {
            synonyms.append(RealmSynonymModel(synonym: synonym))
        }
        
        for example in translation.examples {
            examples.append(RealmExampleModel(example: example))
        }
    }
}
