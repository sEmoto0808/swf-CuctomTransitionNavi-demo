//
//  ListCollectionCell.swift
//  swf-CustomTransition-demo
//
//  Created by S.Emoto on 2018/05/26.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {
    
    var image: UIImage? {
        set {
            
            self.photoImageView?.image = newValue
        }
        get {
            return self.photoImageView?.image
        }
    }
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    class func cellOfSize() -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 10) / 4
        return CGSize(width: width, height: width)
    }
}
