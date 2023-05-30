//
//  HeaderView.swift
//  AmericanGiants
//
//  Created by Ezhilarasi on 12/05/23.
//

import UIKit

class HeaderView: UIView {
    
    private let headerImageView : UIImageView = {
        let headerImage = UIImageView()
        headerImage.contentMode = .scaleAspectFit
        headerImage.clipsToBounds = true
        headerImage.image = UIImage(named: "MegaSale")
        return headerImage
    }()

    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(headerImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        headerImageView.frame = bounds
    }
    
    

}
