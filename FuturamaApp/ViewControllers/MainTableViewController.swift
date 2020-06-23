//
//  MainTableViewController.swift
//  FuturamaApp
//
//  Created by Pavel Parshin on 23.06.2020.
//  Copyright © 2020 Pavel Parshin. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    private let mainCharacters = MainCharacters.shared.character

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainCharacters.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "charactersCell", for: indexPath)

        cell.textLabel?.text = mainCharacters[indexPath.row]

        return cell
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let characterQuote = segue.destination as! QuotesTableViewController
        characterQuote.character = mainCharacters[indexPath.row]
    }
    

}
