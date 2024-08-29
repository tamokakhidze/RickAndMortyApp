//
//  EpisodesViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import Foundation
import NetworkServicePackage

class EpisodesViewViewModel: ObservableObject {
    @Published var episodesArray = [Episode]()
    private let url = "https://rickandmortyapi.com/api/episode"
    
    func viewAppeared() {
        fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.episodesArray = success.results
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func fetchData(completion: @escaping (Result<EpisodesInfo,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
}
