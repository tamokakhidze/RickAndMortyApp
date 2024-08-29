//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import SwiftUI

struct ContentView: View {
    //@StateObject var viewModel = CharacterViewViewModel()
    
    var body: some View {
        TabView {
            CharacterView()
                .tabItem {
                    Image(systemName: "person")
                }
            
            EpisodesView()
                .tabItem {
                    Image(systemName: "play.tv.fill")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
        }
    }
}

#Preview {
    ContentView()
}
