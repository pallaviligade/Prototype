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
    @IBOutlet weak var feedImageContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        feedImageView.alpha = 0
        feedImageContainer.startShimmering()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        feedImageView.alpha = 0
        feedImageView.startShimmering()

    }
    
    func fadeIn(_ image:UIImage?) {
        feedImageView.image = image
        UIView.animate(
                    withDuration: 0.25,
                    delay: 1.25,
                    options: [],
                    animations: {
                        self.feedImageView.alpha = 1
                    }, completion: { completed in
                        if completed {
                            self.feedImageContainer.stopShimmering()
                        }
                    })
    }

}

private extension UIView {
    private var shimmerAnimationKey:String {
        return "shimmer"
    }
    
    func startShimmering() {
            let white = UIColor.white.cgColor
            let alpha = UIColor.white.withAlphaComponent(0.7).cgColor
            let width = bounds.width
            let height = bounds.height

            let gradient = CAGradientLayer()
            gradient.colors = [alpha, white, alpha]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.4)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.6)
            gradient.locations = [0.4, 0.5, 0.6]
            gradient.frame = CGRect(x: -width, y: 0, width: width*3, height: height)
            layer.mask = gradient

            let animation = CABasicAnimation(keyPath: #keyPath(CAGradientLayer.locations))
            animation.fromValue = [0.0, 0.1, 0.2]
            animation.toValue = [0.8, 0.9, 1.0]
            animation.duration = 1
            animation.repeatCount = .infinity
            gradient.add(animation, forKey: shimmerAnimationKey)
        }

        func stopShimmering() {
            layer.mask = nil
        }
}
