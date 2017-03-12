//
//  FavouritesViewController.swift
//  Pokedex
//
//  Created by Sherif Olanrewaju on 12/03/2017.
//  Copyright © 2017 Butterfly. All rights reserved.
//

import UIKit

class FavouritesViewController: UICollectionViewController {
    var favourites = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Favourites"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let savedFavourites = defaults.objectForKey("Favourites") as? [String] ?? [String]()
        
        if favourites != savedFavourites {
            favourites = savedFavourites
            collectionView?.reloadData()
        }
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favourites.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let pokemon = favourites[indexPath.item]
        
        if let imageView = cell.viewWithTag(1024) as? UIImageView {
            imageView.image = UIImage(named: pokemon)
        }
        
        return cell
    }
}
