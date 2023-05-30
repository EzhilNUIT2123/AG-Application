//
//  CollectionTableViewCell.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 18/05/23.
//

import UIKit

class CollectionTableViewCell: UICollectionViewCell {
    
    static let identifier = "TableViewCustomizeCell"
    
    private let posterImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
       fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
}
