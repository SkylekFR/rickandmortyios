//
//  MainView.swift
//  rickandmorty
//
//  Created by Emilien on 13/06/2022.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var mainViewModel = MainViewModel()
    var body: some View {
        ScrollView {
            VStack {
                ForEach(mainViewModel.characterList, id: \.self) { character in
                    NavigationLink {
                        CharacterDetailUIView(characterId: character.id!)
                    } label: {
                        HStack {
                            if #available(iOS 15.0, *) {
                                AsyncImage(
                                    url: URL(string: character.imageUrl ?? ""))
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
                            Text(character.name ?? "")
                            Spacer()
                        }
                    }
                }
            }
            .onAppear() {
                Task {
                    await mainViewModel.fetchCharacterList()
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
