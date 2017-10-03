//
//  ImageViewController.swift
//  ScrollView
//
//  Created by michael chan on 2017/10/3.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    var imageURL: URL?{
        didSet {
            image = nil
            fetchImage()
        }
    }
    
    func fetchImage(){
        if let url =  imageURL{
                let imageData = try! Data(contentsOf: url)
            if imageData != nil
            {
                image = UIImage(data: imageData)
            }
        }
    }
    
    @IBOutlet weak var ScrollView: UIScrollView!
    private var imageView = UIImageView()
    
    private var image: UIImage?{
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            ScrollView?.contentSize = imageView.frame.size
        }
        get{
            return imageView.image
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScrollView.addSubview(imageView)
        imageURL = URL(string: "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507054621981&di=374f4ddcf09a8e3eb9f03c289af25820&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F43a7d933c895d143eba54a2979f082025baf07ec.jpg")
        // Do any additional setup after loading the view.
    }


    

}
