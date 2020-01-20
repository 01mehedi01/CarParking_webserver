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
    
    var image :String?
    var location :String
    var address :String
    
    init(images: String? , locations: String , addresss: String) {
        
        self.image = images
        self.location = locations
        self.address = addresss
    }
}
