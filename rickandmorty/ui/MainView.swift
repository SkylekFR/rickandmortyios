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
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    VStack(spacing: 8) {
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
                                                .frame(width: geo.size.width / 2)
                                                .aspectRatio(contentMode: .fit)
                                                .cornerRadius(10)
                                                .shadow(color: .black, radius: 2, x: 1, y: 1)
                                        }
                                    placeholder: {
                                        ProgressView()
                                    }
                                    } else {
                                        // Fallback on earlier versions
                                    }
                                    Spacer()
                                    Text(character.name ?? "")
                                        .foregroundColor(.black)
                                    Spacer()
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle(Text("Liste des personnages"))
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
