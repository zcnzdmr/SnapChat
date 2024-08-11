//
//  CollectViewController.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class CollectViewController: UIViewController {
    
    var collectionView : UICollectionView!
    var imageArray : [UIImage] = []
    
    
    let labelTimeLeft : UILabel = {
        let labelTime = UILabel()
        labelTime.text = "Time Left : 23 hours"
        labelTime.font = .systemFont(ofSize: 18, weight: .regular)
        labelTime.textAlignment = .center
        labelTime.textColor = .black
//        labelTime.layer.borderWidth = 1
        
        return labelTime
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        self.navigationItem.title = "Collection View"
        setUpComponents()
    }
    
    
    func setUpCollectView() {

        //lay out part
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
        
        //        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
        // This code is the same above code
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(CollectViewCell.self, forCellWithReuseIdentifier:"collectCell")
        
        collectionView.alwaysBounceHorizontal = false // determine if collectView jumps horizontally when you drag
        collectionView.alwaysBounceVertical = false // determine if collectView jumps vertically when you drag
        
        collectionView.showsVerticalScrollIndicator = true // it shows a stick showing that you scroll that way
        collectionView.showsHorizontalScrollIndicator = true  // it shows a stick showing that you scroll that way horizontally
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func setUpComponents() {
        setUpCollectView()
        
        view.addSubview(collectionView)
        view.addSubview(labelTimeLeft)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        labelTimeLeft.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: self.view/*.layoutMarginsGuide*/.topAnchor, constant: 60),
            collectionView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view .layoutMarginsGuide.trailingAnchor),
            
            
            labelTimeLeft.topAnchor.constraint(equalTo: self.view.topAnchor,constant: 5),
            labelTimeLeft.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            labelTimeLeft.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            labelTimeLeft.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.06)
        
        ])

    }
}

extension CollectViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectCell", for: indexPath) as? CollectViewCell else{ fatalError("CollectionView dequeue reusable func not found") }
        
//        cell.layer.borderWidth = 0.5
        cell.imageViewm.image = UIImage(named: "bugs")
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthOfCell = self.collectionView.bounds.width
        let heightOfCell = self.collectionView.bounds.height - 10
        return CGSize(width: widthOfCell, height: heightOfCell)
    }
    
    // This code is used to leave a certain amount of blank at the top of CollectionView
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: 20, height: 200)
//    }
    
//     This code is used to leave a certain amount of blank at the bottom of CollectionView
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
//        return CGSize(width: 20, height: 20)
//    }
}
