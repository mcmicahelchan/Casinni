//
//  ImageViewController.swift
//  ScrollView
//
//  Created by michael chan on 2017/10/3.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {
   
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    var imageURL: URL?{
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    func fetchImage(){
        if let url =  imageURL{
            indicator.startAnimating()
            DispatchQueue.global(qos: .userInitiated).async { // 1
                let imageData = try! Data(contentsOf: url)
                DispatchQueue.main.async { // 2
                    if imageData != nil
                    {
                        self.image = UIImage(data: imageData)
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var ScrollView: UIScrollView! {
        didSet{
            ScrollView.contentSize = imageView.frame.size
            ScrollView.delegate = self
            ScrollView.minimumZoomScale = 0.03
            ScrollView.maximumZoomScale = 1.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage?{
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            ScrollView?.contentSize = imageView.frame.size
            indicator?.stopAnimating()
        }
        get{
            return imageView.image
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.addSubview(imageView)
        // Do any additional setup after loading the view.
    }


    

}
