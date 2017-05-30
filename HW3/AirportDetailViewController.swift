//
//  AirportDetailViewController.swift
//  HW3
//
//  Created by MacBook on 2017/5/30.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class AirportDetailViewController: UIViewController {
    @IBOutlet weak var AirportName: UILabel!
    @IBOutlet weak var Country: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var CityCode: UINavigationItem!

    
    var detailInfo : [String:String]? {
        didSet{
            if self.isViewLoaded{
                self.updateUIElements()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CityCode.title = detailInfo!["CityCode"]
        self.updateUIElements()
    }
    
    func updateUIElements() {
        self.AirportName.text = detailInfo?["AirportName"]
        self.AirportName.numberOfLines = 0;
        self.AirportName.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.City.text = detailInfo?["CityName"]
        self.Country.text = detailInfo?["CountryName"]
        self.Picture.frame = CGRect(x: 0, y: 320, width: 420, height: 440)
        self.Picture.image = UIImage(named:"Airports Data/"+detailInfo!["CityCode"]!+".jpg")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
