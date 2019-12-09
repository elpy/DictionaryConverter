//
//  RealmSynonymModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 08.12.2019.
//

import Foundation
import RealmSwift

class RealmSynonymModel: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var partOfSpeech: String = ""
}

extension RealmSynonymModel {
    convenience init(synonym: Synonym) {
        self.init()
        
        text = synonym.text
        partOfSpeech = synonym.partOfSpeech.rawValue
    }
}
