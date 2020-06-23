//
//  Character.swift
//  FuturamaApp
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

struct CharacterQuote: Decodable {
    var character: String
    var quote: String
    var image: String
}

class MainCharacter {
    
    let shared = MainCharacter()
    
    let character = ["Bender", "Fry", "Leela", "Professor Farnsworth", "Amy", "Zapp Brannigan",
    "Lurr", "Dr Zoidberg", "Linda the reporter", "Bob Barker", "Hermes", "Morgan Proctor",
    "Mom", "Robot Mob", "Giant Bender", "Kif", "Don bot"]
}
