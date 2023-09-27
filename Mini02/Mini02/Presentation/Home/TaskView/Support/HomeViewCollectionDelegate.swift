//
//  HomeViewCollectionDelegate.swift
//  Mini02
//
//  Created by Luca Lacerda on 27/09/23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate{

}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.view.frame.width * 0.85
        let height = self.view.frame.height * 0.10
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}
