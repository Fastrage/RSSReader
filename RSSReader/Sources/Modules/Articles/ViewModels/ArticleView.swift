//
//  ArticleView.swift
//  RSSReader
//
//  Created by Олег Крылов on 05/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import UIKit

class ArticleView: UIView {

    private let titleLabel = UILabel()
    private let shortDescriptionLabel = UILabel()
    private let cellImageView = UIImageView()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.frame = frame
        self.addSubview(titleLabel)
        self.addSubview(shortDescriptionLabel)
        self.addSubview(cellImageView)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.titleLabel.numberOfLines = 3
        self.shortDescriptionLabel.numberOfLines = 10
        
        self.titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.titleLabel.textColor = .black
        
        self.shortDescriptionLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        self.shortDescriptionLabel.textColor = .black
        
        self.cellImageView.contentMode = .scaleAspectFill
        self.layoutSubviews()
        let maxImageWidth = self.frame.width
        let maxImageHeight = maxImageWidth * 1.2
        let imageOrigin = CGPoint(x: 0, y: 0)
        self.cellImageView.frame.origin = imageOrigin
        self.cellImageView.frame.size = CGSize(width: maxImageWidth, height: maxImageHeight)
        
        let maxLabelWidth = self.frame.width - Constants.margin * 2
        let maxLabelSize = CGSize(width: maxLabelWidth, height: .greatestFiniteMagnitude)
        
        self.titleLabel.frame.origin = CGPoint(x: Constants.margin, y: self.cellImageView.frame.maxY + Constants.margin)
        self.titleLabel.frame.size = maxLabelSize
        
        let shortDescriptionSize = self.shortDescriptionLabel.sizeThatFits(maxLabelSize)
        let shortDescriptionOrigin = CGPoint(x: Constants.margin,
                                             y:  self.titleLabel.frame.maxY + Constants.margin)
        
        self.shortDescriptionLabel.frame.origin = shortDescriptionOrigin
        self.shortDescriptionLabel.frame.size = shortDescriptionSize
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
private struct Constants {
    static let margin: CGFloat = 24
    static let titleMarginBottom: CGFloat = 8
}
