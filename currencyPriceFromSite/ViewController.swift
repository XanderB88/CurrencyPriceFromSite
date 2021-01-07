//
//  ViewController.swift
//  currencyPriceFromSite
//
//  Created by Alexander on 07.01.2021.
//

import UIKit
import SwiftSoup

class ViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURLString = "https://ru.tradingview.com/markets/cryptocurrencies/prices-all/"
        guard let myURL = URL(string: myURLString) else {
            return
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .utf8)
            let htmlContent = myHTMLString
            
            do {
                let document = try SwiftSoup.parse(htmlContent)
                do {
                    let element = try document.select("td").array()
                    do {
                        let bitcoinPrice = try element[3].text()
                        textLabel.text = bitcoinPrice
                    }
                } catch {
                    
                }
            }
            
        } catch let error {
            print("Error: \(error)")
        }
    }
    
    
}

