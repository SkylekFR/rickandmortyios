//
//  CharacterRepository.swift
//  rickandmorty
//
//  Created by Emilien on 29/09/2022.
//

import Foundation
import Alamofire

protocol CharacterRepository {
    func getCharacters() async throws -> Result<RickAndMortyResponse<Character>, AFError>
    func getCharacter(id: Int) async throws -> Result<Character, AFError>
}

