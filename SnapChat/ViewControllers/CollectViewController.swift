//
//  CollectViewController.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class CollectViewController: UIViewController {
    
    var collectionView : UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        self.navigationItem.title = "Collection View"
        setUpComponents()
    }
    
    
    func setUpCollectView() {

        //lay out part
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 120, right: 0)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    
        collectionView.register(CollectViewCell.self, forCellWithReuseIdentifier:"collectCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapRightBarButton))
        self.navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func didTapRightBarButton() {
        self.navigationController?.dismiss(animated: true)
    }
    
    func setUpComponents() {
        setUpCollectView()
        
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view/*layoutMarginsGuide*/.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view/*.layoutMarginsGuide*/.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view/*.layoutMarginsGuide*/.trailingAnchor),
        
        ])

    }
}

extension CollectViewController : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"collectCell", for: indexPath) as! CollectViewCell
                
//        else{ fatalError("CollectionView not found") }
        
        cell.imageViewm.image = UIImage(named: "bugs")
        cell.label.text = "Bugs"
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width, height: view.bounds.height)
    }
}
