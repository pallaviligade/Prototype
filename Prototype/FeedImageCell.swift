//
//  FeedImageCell.swift
//  Prototype
//
//  Created by Pallavi on 14.04.23.
//

import UIKit

final class FeedImageCell: UITableViewCell {
    
    
    @IBOutlet private(set) weak var locationContainer: UIStackView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet private(set)  weak var  feedImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedImageView.alpha = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        feedImageView.alpha = 0

    }
    
    func fadeIn(_ image:UIImage?) {
        feedImageView.image = image
        
        UIView.animate(withDuration: 0.3, delay: 0.3) {
            self.feedImageView.alpha = 1
        }
    }

}
