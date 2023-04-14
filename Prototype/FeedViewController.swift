//
//  FeedViewController.swift
//  Prototype
//
//  Created by Pallavi on 13.04.23.
//

import UIKit

struct FeedImageViewModel {
    let description: String?
    let location: String?
    let imageName: String
}

final class FeedViewController: UITableViewController {

    private let feed = FeedImageViewModel.prototypeFeed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .gray
        self.tableView.isHidden = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return feed.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedImageCell", for: indexPath) as!  FeedImageCell
        let model  = feed[indexPath.row]
        cell.configaureCell(with: model)
        
        return cell
    }
    

    

}


extension FeedImageCell {
    
    func configaureCell(with model: FeedImageViewModel)
    {
        locationLabel.text = model.location
        locationContainer.isHidden =  model.location  == nil
        
        discriptionLabel.text = model.description
        discriptionLabel.isHidden = model.description == nil
        
        //feedImageView.image =
        fadeIn(UIImage(named: model.imageName))
        
        
    }
    
}
