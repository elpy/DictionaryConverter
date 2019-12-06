//
//  Synonym.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

protocol Synonym {
    var text: String { get }
    var partOfSpeech: PartOfSpeech { get }
}
