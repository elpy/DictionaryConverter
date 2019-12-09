//
//  RealmExampleModel.swift
//  DictionaryConverter
//
//  Created by Антон Скворцов on 08.12.2019.
//

import Foundation
import RealmSwift

class RealmExampleModel: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var translation: String = ""
    @objc dynamic var type: String = ""
}

extension RealmExampleModel {
    convenience init(example: Example) {
        self.init()
        
        text = example.text
        translation = example.translation
        type = example.type.rawValue
    }
}
