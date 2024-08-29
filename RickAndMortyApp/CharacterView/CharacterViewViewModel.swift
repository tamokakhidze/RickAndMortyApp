//
//  CharacterViewViewModel.swift
//  RickAndMortyApp
//
//  Created by Tamuna Kakhidze on 28.08.24.
//

import Foundation
import NetworkServicePackage

class CharacterViewViewModel: ObservableObject {
    
    @Published var charactersArray = [Character]()
    private let url = "https://rickandmortyapi.com/api/character"
    
    func viewAppeared() {
        fetchData() { [weak self] result in
            switch result {
            case .success(let success):
                self?.charactersArray = success.results
            case .failure(let failure):
                print("fetching failed. \(failure)")
            }
        }
    }
    
    func fetchData(completion: @escaping (Result<CharacterInfo,Error>) ->(Void)){
        NetworkService().getData(urlString: url, completion: completion)
    }
}
