//
//  SearchView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel = SearchViewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker("Category", selection: $viewModel.searchingSegment) {
                    ForEach(Characters.allCases) { character in
                        Text(character.rawValue)
                    }
                }
                .textInputAutocapitalization(.never)
                .padding()
                .pickerStyle(.segmented)
                .onChange(of: viewModel.searchingSegment) {
                    viewModel.cleanText()
                    print(viewModel.searchingSegment)
                }
                
                Spacer()
                
                List {
                    ForEach(viewModel.resultArray, id: \.id) { result in
                        HStack(spacing: 12) {
                            if let image = result.image {
                                let imageUrl = URL(string: image)
                                AsyncImage(url: imageUrl) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .scaledToFill()
                                        .clipped()
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 40, height: 40)
                                }
                                .frame(width: 40, height: 40)
                                .cornerRadius(32)
                            }
                            Text(result.name)
                        }
                    }
                }.searchable(
                    text: $viewModel.text,
                    prompt: "Search \(viewModel.searchingSegment.rawValue.capitalized)"
                )
                .onChange(of: viewModel.text ) {
                    viewModel.getResults()
                }
                Spacer()
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    ContentView()
}
