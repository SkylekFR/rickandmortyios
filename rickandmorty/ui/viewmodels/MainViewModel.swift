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
    
    private var characterRepository: CharacterRepository = CharacterRepository()
    
    init() {
        fetchCharacterList()
    }
    
    private func fetchCharacterList() {
        Task.detached {
            do {
                let result = try await self.characterRepository.getCharacters()
                self.characterList.append(contentsOf: try result.get().results)
            }
            catch {
                
            }
        }
    }
    
    private func fetchCharacter(id: Int) {
        Task.detached {
            do {
                let result = try await self.characterRepository.getCharacter(id: id)
                self.detailedCharacter = try result.get()
            }
            catch {
                
            }
        }
    }
    
}
