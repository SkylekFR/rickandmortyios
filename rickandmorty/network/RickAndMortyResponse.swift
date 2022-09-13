//
//  RickAndMortyResponse.swift
//  rickandmorty
//
//  Created by Emilien on 13/09/2022.
//

import Foundation

public struct RickAndMortyResponse<T: Codable> : Codable {
    var results: [T] = []
}

extension RickAndMortyResponse {
    
    enum CodingKeys: CodingKey {
        case results
    }
}


