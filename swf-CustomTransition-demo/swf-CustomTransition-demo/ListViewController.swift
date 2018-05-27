//
//  ViewController.swift
//  swf-CustomTransition-demo
//
//  Created by S.Emoto on 2018/05/25.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

var photos = [UIImage]()

class ListViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    var selectedImageView: UIImageView?
    
    private let dataSource = ListProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! ListCollectionCell
        self.selectedImageView = cell.photoImageView
        
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        controller.image = self.selectedImageView?.image
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return ListCollectionCell.cellOfSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
}

extension ListViewController {
    
    func setup() {
        photoCollectionView.dataSource = dataSource
        
        self.view.backgroundColor = UIColor.white
        for i in 1...3 {
            let photoName = "photo_" + String(i) + ".jpeg"
            photos.append(UIImage(named: photoName) ?? UIImage())
        }
    }
 
    func createImageView() -> UIImageView? {
        
        guard let selectedImageView = self.selectedImageView else {
            return nil
        }
        let imageView = UIImageView(image: selectedImageView.image)
        imageView.contentMode = .scaleAspectFill
        imageView.frame = selectedImageView.convert(selectedImageView.frame, to: self.view)
        
        
        return imageView
    }
}

