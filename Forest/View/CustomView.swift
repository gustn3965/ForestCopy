//
//  CustomView.swift
//  Forest
//
//  Created by hyunsu on 2020/10/31.
//

import UIKit

class CustomView : UIView {
    var backgroundView : UIView!
    var imageView : UIImageView!
    var label : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }
    convenience init() {
        self.init(frame:.zero)
    }
    
    func setView() {
        setBackground()
        setLabel()
        setImageView()
        
    }
    func setBackground() {
        backgroundView = UIView()
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        backgroundView.setRound()
        NSLayoutConstraint.activate(
            [backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
             backgroundView.leftAnchor.constraint(equalTo: leftAnchor, constant: 17),
             backgroundView.rightAnchor.constraint(equalTo: rightAnchor, constant: -17),
             backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),])
    }
    func setLabel() {
        label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(label)
        label.backgroundColor = .clear
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        
        NSLayoutConstraint.activate(
            [label.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 10),
             label.rightAnchor.constraint(equalTo: backgroundView.rightAnchor,constant: -10),
             label.topAnchor.constraint(equalTo: backgroundView.topAnchor,constant: 10)])
        
    }
    func setImageView() {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [imageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0),
             imageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0),
             imageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
             imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
             ])
    }
    
    func setText(_ text : String) {
        label.text = text
    }
    func setBackgroundColor(_ color : UIColor) {
        backgroundView.backgroundColor = color
    }
    func setImage(_ image : String) {
        imageView.image = UIImage(named: image)
    }
}

