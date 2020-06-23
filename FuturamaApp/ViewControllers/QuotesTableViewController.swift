//
//  QuotesTableViewController.swift
//  FuturamaApp
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class QuotesTableViewController: UITableViewController {
    
    var character: String!
    var urlString: String {
        NetworkManager.shared.getUrl(character: character)
    }
    
    private var characterQuotes: [CharacterQuote] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = character + "'s quotes"
        tableView.rowHeight = 100
        
        NetworkManager.shared.quoteData(from: urlString) { quote in
            DispatchQueue.main.async {
                self.characterQuotes = quote
                self.tableView.reloadData()
            }
        }

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterQuotes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "quotesCell", for: indexPath)

        let characterQuote = characterQuotes[indexPath.row]
        configCell(cell: cell, character: characterQuote)
        
        return cell
    }

    //MARK: - Private Methods
    private func configCell(cell: UITableViewCell, character: CharacterQuote) {
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = character.quote
        
        DispatchQueue.global().async {
            guard let stringImageUrl = character.image else { return }
            guard let imageUrl = URL(string: stringImageUrl) else { return }
            do {
                let imageData = try Data(contentsOf: imageUrl)
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                    cell.imageView?.sizeThatFits(CGSize(width: 50, height: 50))
                }
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
