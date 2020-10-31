//
//  ViewController.swift
//  Forest
//
//  Created by hyunsu on 2020/10/31.
//

import UIKit

struct Forest {
    var name : String
    var image : String
    var color : UIColor
}

let colorList = [#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1),#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1),#colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1),#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)]

class ViewController: UIViewController {

    var data : [Forest] = [Forest(name: "주민1", image: "forest1", color: colorList[0]),
                           Forest(name: "주민2", image: "forest2", color: colorList[1]),
                           Forest(name: "주민3", image: "forest3", color: colorList[2]),
                           Forest(name: "주민4", image: "forest4", color: colorList[3]),
                           Forest(name: "주민5", image: "forest5", color: colorList[4]),
                           Forest(name: "주민6", image: "forest6", color: colorList[5]),
                           Forest(name: "주민7", image: "forest7", color: colorList[6])]
    
    let inset = UIEdgeInsets(top: 10, left: 10, bottom: 5, right: 10)
    var collectionView : UICollectionView!
    var flowLayout : UICollectionViewFlowLayout = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        return layout
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCollectionView()
        
    }
    func setCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(Cell.self, forCellWithReuseIdentifier: "cell")
        self.view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 100),
             collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor,constant: 0),
             collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant: 0),
             collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor,constant: 0)])
        
    }
    
}
extension ViewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func  collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? Cell else { return UICollectionViewCell() }
        cell.customView.setText(data[indexPath.item].name)
        cell.customView.setBackgroundColor(data[indexPath.item].color)
        cell.customView.setImage(data[indexPath.item].image)
        return cell
    }
}


extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width - (inset.left *  3)
        print(self.view.frame.width)
        print(inset.left, inset.right)
        print(width/2)
        return CGSize(width: (width/2), height: width/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return inset
    }
}


