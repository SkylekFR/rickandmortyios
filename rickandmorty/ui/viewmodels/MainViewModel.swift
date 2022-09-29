//
//  MainViewModel.swift
//  rickandmorty
//
//  Created by Emilien on 13/09/2022.
//

import Foundation
import Swinject
import Combine
import Alamofire

class MainViewModel: ObservableObject {
    
    @Published var characterList: [Character] = []
    @Published var detailedCharacter: Character?
    
    @Published var isFetching = false
    
    private var characterRepository: CharacterRepository = CharacterRepositoryImpl()
    
    @MainActor
    func fetchCharacterList() async {
        isFetching = true
        do {
            try await self.characterList = self.characterRepository.getCharacters().get().results
            isFetching = false
        }
        catch {
            isFetching = false
        }
    }
    
    @MainActor
    func fetchCharacter(id: Int) async {
        isFetching = true
        do {
            let result = try await self.characterRepository.getCharacter(id: id)
            self.detailedCharacter = try result.get()
            isFetching = false
        }
        catch {
            isFetching = false
        }
    }
    
}
