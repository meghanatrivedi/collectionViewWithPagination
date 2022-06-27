//
//  ViewController.swift
//  collectionViewWithPagination
//
//  Created by Meghna on 27/06/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prePareUI()
    }


}

extension ViewController{
    func prePareUI(){
        colView.delegate = self
        colView.dataSource = self
        self.colView.register(UINib(nibName: "imageCollectionView", bundle: nil), forCellWithReuseIdentifier: "imageCollectionView")

    }
}
extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : imageCollectionView = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionView", for: indexPath) as! imageCollectionView
                return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth : CGFloat = 300.0

            let numberOfCells = floor(colView.frame.size.width / cellWidth)
            let edgeInsets = (colView.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)

        return UIEdgeInsets(top: 15, left: edgeInsets, bottom: 0, right: edgeInsets)
        }
    
}
//extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        let itemWidth = 80
//        let spacingWidth = 4
//        let numberOfItems = collectionView.numberOfItems(inSection: section)
//        let cellSpacingWidth = 300//numberOfItem * spacingWidth
//        let totalCellWidth = numberOfItems * itemWidth + cellSpacingWidth
//        let inset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth)) / 2
//        return UIEdgeInsets(top: 5, left: inset, bottom: 5, right: inset)
//    }
//}
