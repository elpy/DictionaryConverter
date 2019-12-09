//
//  Example.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

struct Example {
    let text: String
    let translation: String
    let type: ExampleType
}

enum ExampleType: String {
    case phrase = "phrase"
    case sentence = "sentence"
}
