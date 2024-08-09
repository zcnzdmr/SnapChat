//
//  CollectViewController.swift
//  SnapChat
//
//  Created by Özcan on 9.08.2024.
//

import UIKit

class CollectViewController: UIViewController {
    
    var collectionView : UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
    }
    
    
    func setUpCollectView() {
        collectionView?.delegate = self
        collectionView?.dataSource = self
    }
}

extension CollectViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectViewCell.identifier, for: indexPath) as? CollectViewCell else{
            fatalError("CollectionView not found")
        }
        
        
        return cell
    }
    
    
}
