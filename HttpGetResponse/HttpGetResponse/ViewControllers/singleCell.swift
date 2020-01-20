//
//  singleCell.swift
//  HttpGetResponse
//
//  Created by Mehedi Hasan on 2/12/19.
//  Copyright © 2019 Mehedi Hasan. All rights reserved.
//

import Foundation
import UIKit

class SingleView{
    
    var ImageView :UIImage
    var location :String
    var address :String
    
    init(ImageView:UIImage,location:String,address :String) {
        
        self.ImageView = ImageView
        self.location = location
        self.address = address
    }
}
