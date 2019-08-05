//
//  FeedViewCell.swift
//  RSSReader
//
//  Created by Олег Крылов on 04/08/2019.
//  Copyright © 2019 OlegKrylov. All rights reserved.
//

import UIKit

class FeedViewCell<T: UIView>: UITableViewCell {
    
    let containerView: T
    
    override init(frame: CGRect) {
        self.containerView = T(frame: .zero)
        super.init(frame: frame)
        self.contentView.addSubview(self.containerView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("unsupported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.containerView.frame = self.contentView.frame
    }
}
