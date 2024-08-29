//
//  SearchViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import Foundation
import NetworkServicePackage

enum Characters: String, CaseIterable, Identifiable {
    case Character, Episode
    var id: Self { self }
}

protocol Searchable {
    var name: String { get }
    var image: String? { get }
    var id: Int { get }
}


class SearchViewViewModel: ObservableObject {
    
    @Published var resultArray = [Searchable]()
    @Published var text = ""
    @Published var searchingSegment = Characters.Character
    
    func cleanText() {
        text = ""
    }
    
    func getResults() {
        resultArray = []
        if text != "" {
            switch searchingSegment {
            case .Character:
                loadCharacter()
            case .Episode:
                loadEpisodes()
            }
        }
    }
    
    func loadCharacter() {
        let url = "https://rickandmortyapi.com/api/character/?name=\(text)"
        fetchCharacterData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                self?.resultArray = success.results
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func loadEpisodes() {
        let url = "https://rickandmortyapi.com/api/episode/?name=\(text)"
        fetchEpisodesData(url: url) { [weak self] result in
            switch result {
            case .success(let success):
                self?.resultArray = success.results
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func fetchCharacterData(url: String, completion: @escaping (Result<CharacterInfo,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
    
    func fetchEpisodesData(url: String, completion: @escaping (Result<EpisodesInfo,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
}


