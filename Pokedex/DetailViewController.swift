//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Sherif Olanrewaju on 11/03/2017.
//  Copyright © 2017 Butterfly. All rights reserved.
//

import UIKit

class DetailViewController: UITableViewController {
    var pokemon: Pokemon!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var evolution: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = pokemon.name
        
        imageView.image = UIImage(named: pokemon.name)
        name.text = pokemon.name
        type.text = pokemon.type
        summary.text = pokemon.summary
        
        if pokemon.evolutions.count > 0 {
            evolution.text = "\(pokemon.name) > " + pokemon.evolutions.joinWithSeparator(" > ")
        } else {
            evolution.text = pokemon.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 3 {
            // This is the summary cell
            return UITableViewAutomaticDimension
        } else {
            return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
        }
    }
}
