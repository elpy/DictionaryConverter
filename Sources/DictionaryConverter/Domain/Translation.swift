//
//  Translation.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

protocol Translation {
    var text: String { get }
    var relatedRecords: [String] { get }
    var synonyms: [Synonym] { get }
    var examples: [Example] { get }
}
