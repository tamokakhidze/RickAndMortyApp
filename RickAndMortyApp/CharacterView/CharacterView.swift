//
//  CharacterView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct CharacterView: View {
    
    @StateObject var viewModel = CharacterViewViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ScrollView(.vertical) {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.charactersArray) { character in
                        NavigationLink(value: character.id) {
                            CardView(character: character)
                        }
                    }
                }
                .padding()
            }.onAppear(perform: {
                viewModel.viewAppeared()
            })
            .navigationDestination(for: Int.self) { characterId in
                DetailsView(characterId: characterId)
            }
        }
    }
}

#Preview {
    CharacterView()
}
