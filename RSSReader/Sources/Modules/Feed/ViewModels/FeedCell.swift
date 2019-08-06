//
//  FeedCardView.swift
//  RSSReader
//
//  Created by Олег Крылов on 04/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
    
    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let cellImageView = UIImageView()
    private let imageDownloader = ImageDownloader()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.cellImageView)
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.shortDescriptionLabel)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 2
        
        self.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.titleLabel.textColor = .white
        
        self.shortDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.shortDescriptionLabel.textColor = .white
        
        self.cellImageView.contentMode = .scaleAspectFill
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        let maxLabelWidth = self.frame.width - Constants.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        
        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: Constants.margin,
                                             y: self.frame.height - Constants.margin - shortDescriptionSize.height)
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionSize
        
        
        let titleLabelSize = self.titleLabel.sizeThatFits(maxLabelSize)
        let titleLabelOrigin = CGPoint(x: Constants.margin,
                                       y: self.shortDescriptionLabel.frame.minY - Constants.titleMarginBottom - titleLabelSize.height)
        self.titleLabel.frame.origin = titleLabelOrigin
        self.titleLabel.frame.size = titleLabelSize
        
        self.cellImageView.frame = self.contentView.frame
    }
    
    func update(with viewModel: Article) {
        self.titleLabel.text = viewModel.title
        self.shortDescriptionLabel.text = viewModel.content
        imageDownloader.getPhoto(url: viewModel.imageURL, completion: { (image, error) in
            DispatchQueue.main.async {
                self.cellImageView.image = image
            }
        })
        self.setNeedsLayout()
    }
}

private struct Constants {
    static let margin: CGFloat = 24
    static let titleMarginBottom: CGFloat = 8
}
