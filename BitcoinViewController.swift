//
//  BitcoinViewController.swift
//  Bitcoin Price Tracker
//
//  Created by ZappyCode on 10/9/19.
//  Copyright © 2019 ZappyCode. All rights reserved.
//

import UIKit

class BitcoinViewController: UIViewController {
    
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPrice()
        
    }
        
      
    func getPrice() {
        if let url = URL(string:  "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=USD,JPY,EUR"){
                  URLSession.shared.dataTask(with: url){(data:Data?,response:URLResponse?,error:Error?) in
                      
                      if error == nil{
                          
                          if data != nil {
                       if let json = try? JSONSerialization.jsonObject(with: data!, options: []) as?
                          [String:Double] {
                          DispatchQueue.main.async {
                          
                          if let usdPrice = json["USD"]{
                           
                            self.usdLabel.text = self.getStringFor(price: usdPrice, currencyCode:"USD")
                            
                           }
                          if let eurPrice = json["EUR"]{
                              self.euroLabel.text = "€:\(eurPrice)"
                          }
                          if let jpyPrice = json["JPY"]{
                              self.yenLabel.text = "¥:\(jpyPrice)"
                          }
                              }
                          }
                          
                      }
                          
                      }   else {
                          print("We have an error")
                      }
                  }.resume()
              }
              
              }
    func getStringFor(price:Double, currencyCode:String) -> String {
        let formatter = NumberFormatter()
                                 formatter.numberStyle = .currency
                                 formatter.currencyCode = currencyCode
        if let priceString = formatter.string(from: NSNumber(value: price)){
            return priceString
        }
        return "Error"
        
    }
        
    
    @IBAction func refresh(_ sender: Any) {
        getPrice()
    }
}
