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
    private var characterRepository: CharacterRepository = CharacterRepository()
    
    init() {
        fetchCharacterList()
    }
    
    private  func fetchCharacterList() {
        Task.init {
            do {
                let result = try await characterRepository.getCharacters()
                characterList.append(contentsOf: try result.get().results)
            }
            catch {
                
            }
        }
    }
    
}
