//
//  NetworkManager.swift
//  FuturamaApp
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    let urlString = "https://futuramaapi.herokuapp.com/api/characters/"
    
    func quoteData(from urlString: String, complition: @escaping ([CharacterQuote]) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { print(error); return }
            guard let data = data else { return }
            do {
                let characterQuotes = try JSONDecoder().decode([CharacterQuote].self, from: data)
                complition(characterQuotes)
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    func getUrl(character: String) -> String {
        let correctCharacter = character.replacingOccurrences(of: " ", with: "-")
        return urlString + correctCharacter
    }
}
