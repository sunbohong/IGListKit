//
//  CollectionCell.swift
//  IGListKitExamples
//
//  Created by sunbohong on 16/10/17.
//  Copyright © 2016年 Instagram. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        self.contentView.addSubview(view)
        return view
    }()

    lazy var detailLabel: UILabel = {
        let view = UILabel()
        view.textColor = UIColor.lightGray
        self.contentView.addSubview(view)
        return view
    }()

    lazy var separator: UIView = {
        let separator = UIView()
        self.contentView.addSubview(separator)
        return separator
    }()

    override var bounds: CGRect {
        didSet {
            contentView.frame = bounds
        }
    }
}
