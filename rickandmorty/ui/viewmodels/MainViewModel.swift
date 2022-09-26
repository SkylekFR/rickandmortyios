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
    
    @MainActor
    func fetchCharacterList() async {
        do {
          try await self.characterList = self.characterRepository.getCharacters().get().results
        }
        catch {
            
        }
    }
    
    @MainActor
    func fetchCharacter(id: Int) async {
            do {
                let result = try await self.characterRepository.getCharacter(id: id)
                self.detailedCharacter = try result.get()
            }
            catch {
                
            }
    }
    
}
