//
//  PostVC.swift
//  HttpGetResponse
//
//  Created by Mehedi Hasan on 19/1/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class PostVC: UIViewController {
    
    @IBOutlet weak var ownerName: CustomTextField!
    
    @IBOutlet weak var ownerPhoneNo: CustomTextField!
    
    @IBOutlet weak var ownerLocation: CustomTextField!
    
    @IBOutlet weak var ownerHouseNo: CustomTextField!
    @IBOutlet weak var ownerAddress: CustomTextField!
    
    @IBOutlet weak var parkingType: CustomTextField!
    
    
    
    
    let backgroundImageView = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()

    }
    
     // ******************         save data to Webserver  **************************

    @IBAction func SaveBtn(_ sender: Any) {
        print("Cool => ")
        
        let name = ownerName.text!
        let phoneNo = ownerPhoneNo.text!
        let location =     ownerLocation.text!
        let houseNo =  ownerHouseNo.text!
        let address =  ownerAddress.text!
        let parkingtype =  parkingType.text!
        
        
        let error = validTextFild()
        
        if error != nil {
            
            print("Empty")
            
        }else{
            
            print("Home = > \(name)")
            let url = "https://ubarcarparkingbd.000webhostapp.com/api/post"
            
            let parameters: [String: Any] = [
                "home_owner_name" : name,
                "home_owner_phone_no" : phoneNo,
                "home_owner_location" : location,
                "home_owner_house_no" : houseNo,
                "home_owner_address" : address,
                "home_owner_parking_type" : parkingtype
            
            ]
            
            
            
            Alamofire.request(url, method: .post, parameters: parameters).responseString { (response) in
                if response.result.isSuccess{
                    print("SuccessFully Save")
                }else{
                    print("Save Fail ")
                }
            }
            
            
        }
        
    }
    
    
    
    // ******************         set background Image  **************************
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "postback")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    
    func validTextFild() -> String? {
        if (ownerName.text?.trimmingCharacters(in: .whitespaces)) == "" ||
            (ownerPhoneNo.text?.trimmingCharacters(in: .whitespaces)) == "" ||
            (ownerLocation.text?.trimmingCharacters(in: .whitespaces)) == "" ||
            (ownerAddress.text?.trimmingCharacters(in: .whitespaces)) == "" ||
            (ownerHouseNo.text?.trimmingCharacters(in: .whitespaces)) == "" ||
            (parkingType.text?.trimmingCharacters(in: .whitespaces)) == ""{
            return "Please feel All field"
        }
        
        return nil
        
        
        
    }

}
