//
//  ViewController.swift
//  HttpGetResponse
//
//  Created by Mehedi Hasan on 2/12/19.
//  Copyright © 2019 Mehedi Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func GetRequestAction(_ sender: Any) {
//        let thirdVC = self.storyboard?.instantiateViewController(withIdentifier: "collectionview") as! UINavigationController
//        navigationController?.isNavigationBarHidden = false
//        //Make sure navigation controller should be there
//        navigationController?.pushViewController(thirdVC, animated: true)
        self.performSegue(withIdentifier: "collectionview", sender: nil)
    }
    
    @IBAction func PostRequestAction(_ sender: Any) {
        self.performSegue(withIdentifier: "postsegue", sender: nil)
        
    }
}

