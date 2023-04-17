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

   // private let feed = FeedImageViewModel.prototypeFeed
    
    private var feed = [FeedImageViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refresh()
    }
    
    @IBAction func refresh() {
        refreshControl?.beginRefreshing()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.feed.isEmpty{
                self.feed = FeedImageViewModel.prototypeFeed
                self.tableView.reloadData()
            }
            self.refreshControl?.endRefreshing()
        }
        
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
