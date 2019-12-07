//
//  Translation.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

struct Translation {
    let text: String
    let relatedRecords: [String]
    let synonyms: [Synonym]
    let examples: [Example]
}
