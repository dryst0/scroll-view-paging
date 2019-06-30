//
//  ViewController.swift
//  PageThisScroll
//
//  Created by Franz Ibañez on 17/06/2019.
//  Copyright © 2019 Franz Ibañez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var images = [UIImageView]()
    var contentWidth: CGFloat = 0.0
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(scrollView.panGestureRecognizer)
    }

    override func viewDidAppear(_ animated: Bool) {
        let scrollViewWidth = scrollView.frame.size.width
        let scrollViewHeight = scrollView.frame.size.height
        let imageWidth: CGFloat = 150
        let imageHeight: CGFloat = 150
        
        for x in 0...2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            var newX: CGFloat = 0.0
            var newY: CGFloat = 0.0
            
            newX = ((scrollViewWidth / 2) + (scrollViewWidth * CGFloat(x))) - (imageWidth / 2)
            newY = (scrollViewHeight / 2) - (imageHeight / 2)
            contentWidth += newX
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX, y: newY, width: imageWidth, height: imageHeight)
        }
        
        scrollView.clipsToBounds = false
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollViewHeight)
    }

}

