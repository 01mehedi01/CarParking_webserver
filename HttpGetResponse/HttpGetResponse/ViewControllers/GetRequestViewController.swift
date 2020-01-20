//
//  GetRequestViewController.swift
//  HttpGetResponse
//
//  Created by Mehedi Hasan on 2/12/19.
//  Copyright © 2019 Mehedi Hasan. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class GetRequestViewController: UIViewController  {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    public var list: [[String: Any]] = [[String: Any]]();
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        FetchData()
        
       
        
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
                        self.tableView.reloadData()
                    
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
extension GetRequestViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Table numberOfRowsInSection  Call  => \(list.count)")
       // tableView.reloadData()
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("Table cellForRowAt  Call  count=> \(list.count) ")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "singlecell") as! SingleRowViewTableViewCell
        
        if  self.list.count > 0
        {
                        let singlevalue  =  self.list[indexPath.row]
                        cell.Location?.text = (singlevalue["home_owner_location"] as? String) ?? ""
                        cell.Address?.text = (singlevalue["home_owner_address"] as? String) ?? ""

            
            if let url = URL(string: "https://ubarcarparkingbd.000webhostapp.com/\((singlevalue["home_owner_parking_image"] as? String) ?? "" )")  {

                do { let data = try Data(contentsOf: url)

                    cell.ImageView?.image = UIImage(data: data)

                    } catch let error  {
                        print("Error : \(error.localizedDescription)")
                    }



            }
            
               
        }
        
        return cell
    }
    
    
}
