//
//  BitcoinViewController.swift
//  Bitcoin Price Tracker
//
//  Created by ZappyCode on 10/9/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string:  "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"){
            URLSession.shared.dataTask(with: url){(data:Data?,response:URLResponse?,error:Error?) in
                
                if error == nil{
                    if data != nil {
                 if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as?
                    [String:Double] {
                    if let usdPrice = json["USD"]{
                        print(usdPrice)
                    }
                    if let eurPrice = json["EUR"]{
                        print(eurPrice)
                    }
                    if let jpyPrice = json["JPY"]{
                        print(jpyPrice)
                    }
                        }
                    }
                    
                } else {
                    print("We have an error")
                }
                
            }.resume()
        }
        // Do any additional setup after loading the view.
       
}
}
