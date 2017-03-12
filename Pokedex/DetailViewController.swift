//
//  DetailViewController.swift
//  Pokedex
//
//  Created by Sherif Olanrewaju on 11/03/2017.
//  Copyright © 2017 Butterfly. All rights reserved.
//

import SafariServices
import UIKit

class DetailViewController: UITableViewController {
    var pokemon: Pokemon!

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var evolution: UILabel!
    @IBOutlet weak var toggleFavourites: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = pokemon.name
        let share = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(sharedTapped))
        let readMore = UIBarButtonItem(barButtonSystemItem: .Bookmarks, target: self, action: #selector(readMoreTapped))
        
        navigationItem.rightBarButtonItems = [share, readMore]
        
        imageView.image = UIImage(named: pokemon.name)
        name.text = pokemon.name
        type.text = pokemon.type
        summary.text = pokemon.summary
        
        if pokemon.evolutions.count > 0 {
            evolution.text = "\(pokemon.name) > " + pokemon.evolutions.joinWithSeparator(" > ")
        } else {
            evolution.text = pokemon.name
        }
        
        setFavouritesLabel()
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        guard indexPath.row == 5 else {return}
        
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
            let defaults = NSUserDefaults.standardUserDefaults()
            var favourites = defaults.objectForKey("Favourites") as? [String] ?? [String]()
            
            if let index = favourites.indexOf(pokemon.name) {
                favourites.removeAtIndex(index)
            } else {
                favourites.append(pokemon.name)
            }
            
            defaults.setObject(favourites, forKey: "Favourites")
            setFavouritesLabel()
    }
    
    func sharedTapped() {
        let vc = UIActivityViewController(activityItems: [pokemon.summary, imageView.image!], applicationActivities: nil)
        presentViewController(vc, animated: true, completion:nil)
    }
    
    func readMoreTapped() {
        if let url = NSURL(string: "http://pokemondb.net/pokedex/\(pokemon.name)") {
            let vc = SFSafariViewController(URL: url)
            presentViewController(vc, animated: true, completion: nil)
        }
    }
    
    func setFavouritesLabel() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let favourites = defaults.objectForKey("Favourites") as? [String] ?? [String]()
        
        if favourites.contains(pokemon.name) {
            toggleFavourites.text = "Remove from favourites"
        } else {
            toggleFavourites.text = "Add to favourites"
        }
    }
    
}
