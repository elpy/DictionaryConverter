//
//  Example.swift
//  MongoSwift
//
//  Created by Антон Скворцов on 04.12.2019.
//

import Foundation

protocol Example {
    var text: String { get }
    var translation: String { get }
    var type: ExampleType { get }
}

enum ExampleType {
    case phrase
    case sentence
}
