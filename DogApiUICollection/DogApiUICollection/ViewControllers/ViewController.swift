//
//  ViewController.swift
//  DogApiUICollection
//
//  Created by Furkan Hanci on 3/28/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView : UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 120)
        collectionView.collectionViewLayout = layout
        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        
       
        
    }
    
    
}


extension ViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        print("Tapped")
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    //    func numberOfSections(in collectionView: UICollectionView) -> Int {
    //        return 10
    //    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        
        cell.fetchRandomDogImage()
        //  cell.backgroundColor = UIColor(named: "Color1")
        
        return cell
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 120)
    }
}



