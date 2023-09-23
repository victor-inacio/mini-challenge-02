//
//  UICollectionDelegate.swift
//  Mini02
//
//  Created by Luca Lacerda on 23/09/23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.texts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = 
    }
    
    
}
