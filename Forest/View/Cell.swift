//
//  Cell.swift
//  Forest
//
//  Created by hyunsu on 2020/10/31.
//

import UIKit

class Cell : UICollectionViewCell {
    let customView = CustomView()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        setView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    
    func setView() {
        contentView.addSubview(customView)
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [customView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 0),
             customView.leftAnchor.constraint(equalTo: contentView.leftAnchor,constant: 0),
             customView.rightAnchor.constraint(equalTo: contentView.rightAnchor,constant: 0),
             customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: 0)])
    }
}
