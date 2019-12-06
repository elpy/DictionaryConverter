//
//  PartOfSpeech.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

enum PartOfSpeech: String {
    case NOUN = "noun"
    case PRONOUN = "pronoun"
    case ADJECTIVE = "adjective"
    case VERB = "verb"
    case ADVERB = "adverb"
    case PREPOSITION = "preposition"
    case CONJUNCTION = "conjunction"
    case INTERJECTION = "interjection"
    case NONE = "none"
}

extension PartOfSpeech {
    init(text: String) {
        let partOfSpeech = PartOfSpeech(rawValue: text)
        
        if let value = partOfSpeech {
            self = value
        } else {
            self = .NONE
        }
    }
}
