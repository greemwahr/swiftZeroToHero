//
//  ViewController.swift
//  Pokedex
//
//  Created by Sherif Olanrewaju on 28/01/2017.
//  Copyright © 2017 Butterfly. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var pokedex = [Pokemon]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "Pokedex"
        
        pokedex.append(Pokemon(name: "Pidgey", type: "Normal / Flying", summary: "Pidgey is pure XP gold", evolutions: ["Pigeotto", "Pidgeot"]))
        pokedex.append(Pokemon(name: "Spearow", type: "Normal / Flying", summary: "Spearow is remarkably angry", evolutions: ["Fearow"]))
        pokedex.append(Pokemon(name: "Jynx", type: "Psychi / Flying", summary: "Will cast a spell on you", evolutions: []))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokedex.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let pokemon = pokedex[indexPath.row]
        cell.textLabel?.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.type
        cell.imageView?.image = UIImage(named: "\(pokemon.name)-Thumb")
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("Detail") as? DetailViewController {
            vc.pokemon = pokedex[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

