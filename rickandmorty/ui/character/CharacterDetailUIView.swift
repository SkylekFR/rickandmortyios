//
//  CharacterDetailUIView.swift
//  rickandmorty
//
//  Created by Emilien on 13/09/2022.
//

import SwiftUI

struct CharacterDetailUIView: View {
    @StateObject var mainViewModel = MainViewModel()
    
    private let characterId: Int
    
    init(characterId: Int){
        self.characterId = characterId
    }
    
    var body: some View {
        HStack {
            if #available(iOS 15.0, *) {
                AsyncImage(
                    url: URL(string: mainViewModel.detailedCharacter?.imageUrl ?? ""))
                { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }
            placeholder: {
                ProgressView()
            }
            } else {
                // Fallback on earlier versions
            }
            Text(mainViewModel.detailedCharacter?.name ?? "")
            Spacer()
        }
        .onAppear() {
            Task {
                await mainViewModel.fetchCharacter(id: characterId)
            }
        }
    }
}

struct CharacterDetailUIView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailUIView(characterId: 1)
    }
}
