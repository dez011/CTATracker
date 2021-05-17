//
//  ViewController.swift
//  CTA
//
//  Created by miguelh on 4/30/21.
//

import UIKit

struct MyVariables {

    static var key = "ff25dab5b7814f4195544c1a924d9dd4"
    static var feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40890&outputType=JSON"
    static var stationClicked = blueLineStationList
    static var blue = true

}






class ViewController: UIViewController {

    @IBAction func blueLineButton(_ sender: UIButton) {
        blue = true
        red = false
        
        print(blue)
        print(red)
        
        
        
        
    }
    @IBAction func redLineButton(_ sender: UIButton) {
        blue = false
        red = true
        print(blue)
        print(red)
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    

    

}
