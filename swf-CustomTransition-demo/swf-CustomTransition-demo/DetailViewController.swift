//
//  DetailViewController.swift
//  swf-CustomTransition-demo
//
//  Created by S.Emoto on 2018/05/25.
//  Copyright © 2018年 S.Emoto. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var image: UIImage?

    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
    }
}

extension DetailViewController {
    
    func createImageView() -> UIImageView? {
        guard let detailImageView = self.detailImageView else {
            return nil
        }
        let imageView = UIImageView(image: self.image)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = detailImageView.frame
        return imageView
    }
    
    @IBAction func didTapDismiss(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
