//
//  DetailsView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct DetailsView: View {
    
    @StateObject var viewModel = DetailsViewViewModel()
    let characterId: Int
    var imageUrl: URL {
        URL(string: (viewModel.character?.image!)!)!
    }
    
    var body: some View {
        VStack {
            if let character = viewModel.character {
                ZStack {
                    AsyncImage(url: imageUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .scaledToFill()
                            .clipped()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: .infinity)
                    .cornerRadius(50)
                    .ignoresSafeArea()
                    
                    Rectangle()
                        .frame(width: .infinity)
                        .cornerRadius(50)
                        .foregroundStyle(Color.black.opacity(0.1))
                        .ignoresSafeArea()
                }
                .frame(height: 400)
                
                Spacer()
                    .frame(height: 20)
                
                HStack {
                    Text("\(character.name)")
                        .fontWeight(.heavy)
                        .font(.system(size: 24))
                    
                    Spacer()
                    
                }
                .padding()
                .frame(height: 20)
                
                HStack {
                    Image(systemName: "person")
                    
                    VStack(alignment: .leading) {
                        Text("Gender")
                        Text("\(character.gender)")
                            .fontWeight(.thin)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Origin")
                        Text("\(character.origin.name)")
                            .fontWeight(.thin)
                    }
                    
                    Image(systemName: "globe.asia.australia")
                    
                }.padding()
                
                HStack {
                    Image(systemName: "opticid")
                    
                    VStack(alignment: .leading) {
                        Text("Specie")
                        Text("\(character.species)")
                            .fontWeight(.thin)
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text("Status")
                        Text("\(character.status)")
                            .fontWeight(.thin)
                    }
                    
                    Image(systemName: "doc.text.below.ecg.rtl")
                    
                }
                .frame(height: 20)
                .padding()
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(viewModel.episodesArray) { episode in
                            EpisodeCard(episode: episode)
                        }
                    }
                }
                
            } else {
                ProgressView()
            }
        }.onAppear {
            viewModel.loadCharacter(characterId: characterId)
        }
        
    }
}
