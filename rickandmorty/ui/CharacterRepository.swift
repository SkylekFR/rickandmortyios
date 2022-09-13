//
//  CharacterRepository.swift
//  rickandmorty
//
//  Created by Emilien on 13/09/2022.
//

import Foundation
import Alamofire

class CharacterRepository {
    
    public func getCharacters() async throws -> Result<RickAndMortyResponse<Character>, AFError> {
        return await AF.request("https://rickandmortyapi.com/api/character", method: .get).serializingDecodable(RickAndMortyResponse<Character>.self).result
    }
}
