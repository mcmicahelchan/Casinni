//
//  File.swift
//  ScrollView
//
//  Created by michael chan on 2017/10/4.
//  Copyright © 2017年 michael chan. All rights reserved.
//

import Foundation

struct Model {
    static let pictures: Dictionary<String, String> = [
    "图片1": "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/pia21936.jpg",
    "图片2": "https://www.nasa.gov/sites/default/files/styles/full_width_feature/public/thumbnails/image/9141932-orig.jpg",
    "图片3": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1507735146&di=e7add61b28198a5909e1e5f4176837f9&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.scol.cn%2Fdata%2Fattachment%2Fforum%2F201304%2F01%2F232445fngz7bkggni5zgnr.jpg"
    ]
    
    static func getUrl(nameOfPic: String) -> String {
        return pictures[nameOfPic]!
    }
}
