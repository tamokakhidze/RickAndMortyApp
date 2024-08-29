//
//  EpisodesView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct EpisodesView: View {
    
    @StateObject var viewModel = EpisodesViewViewModel()
    let columns = [
        GridItem(.flexible())
    ]
    var body: some View {
        VStack {
            Text("Episodes")
                .font(.system(size: 30))
                .fontWeight(.heavy)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            ScrollView(.vertical) {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.episodesArray) { episode in
                        HStack {
                            Text("\(episode.name),")
                            Text("\(episode.air_date)")
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 60)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(14)
                    }
                }
                .padding()
                
            }.onAppear(perform: {
                viewModel.viewAppeared()
            })
        }
        
        
        
    }
}

#Preview {
    ContentView()
}
