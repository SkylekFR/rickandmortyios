//
//  Character.swift
//  rickandmorty
//
//  Created by Emilien on 13/09/2022.
//

import Foundation

public struct Character : Codable, Hashable {
    var id: Int?
    var name: String?
    var imageUrl: String?
}

extension Character {
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageUrl = "image"
    }
}

