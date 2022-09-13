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
                    HStack {
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
                        Text(character.name ?? "")
                        Spacer()
                    }
                    
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
