//
//  GetPostCollectionVC.swift
//  HttpGetResponse
//
//  Created by Mehedi Hasan on 19/1/20.
//  Copyright © 2020 Mehedi Hasan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire



class GetPostCollectionVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    public var list: [[String: Any]] = [[String: Any]]();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         FetchData()
       
        // Register cell classes
       // self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

       
    }
    
    // Fetch Data From Server *********************************
    
    func FetchData(){
        //let url = "https://ubarcarparkingbd.000webhostapp.com/api/get"
        
        Alamofire.request("https://ubarcarparkingbd.000webhostapp.com/api/get").responseJSON { (response) in
            
            if response.result.isSuccess {
                //print("Successfully get Data")
                if let checkResponse = response.result.value as! [String: Any]?{
                    if let checkResponseValue = checkResponse["result"] as! [[String: Any]]?{
                        
                        self.list = checkResponseValue
                        self.collectionView.reloadData()
                        
                        print("list => \(self.list.count)")
                        print("checkResponseValue => \(self.list)")
                        
                    }
                }
            }else{
                print("Alamofire Error: \((description: response.result.isFailure))")
            }
        }
    }

   

   

    

   

}

extension GetPostCollectionVC : UICollectionViewDataSource,UICollectionViewDelegate{
    
    
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("Table numberOfRowsInSection  Call  => \(list.count)")
        
        return list.count
    }
    
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PostCollectionVCell
        
        
        if  self.list.count > 0
        {
            let singlevalue  =  self.list[indexPath.row]
            cell.ownerName?.text = (singlevalue["home_owner_name"] as? String) ?? ""
            cell.ownerLocation?.text = (singlevalue["home_owner_location"] as? String) ?? ""
            cell.ownerAddress?.text = (singlevalue["home_owner_address"] as? String) ?? ""
            
            
            if let url = URL(string: "https://ubarcarparkingbd.000webhostapp.com/\((singlevalue["home_owner_parking_image"] as? String) ?? "" )")  {
                
                do { let data = try Data(contentsOf: url)
                    
                    cell.parkingImage?.image = UIImage(data: data)
                    
                } catch let error  {
                    print("Error : \(error.localizedDescription)")
                }
                
                
                
            }
            
            
        }
        
        cell.contentView.layer.cornerRadius = 4.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.shadowRadius = 4.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius:
            cell.contentView.layer.cornerRadius).cgPath
        
        
        
        return cell
    }
}
