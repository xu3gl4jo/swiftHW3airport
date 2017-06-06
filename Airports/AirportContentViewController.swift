//
//  AppDelegate.swift
//  hw3AirportList
//
//  Created by 李紹威 on 2017/5/29.
//  Copyright © 2017年 李紹威. All rights reserved.
//
import UIKit

class AirportContentViewController: UIViewController {
    @IBOutlet weak var airportLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var IATA: String = ""
    var airport: String = ""
    var city: String = ""
    var country: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.IATA
        airportLabel.numberOfLines = 0;
        self.airportLabel.text = self.airport
        self.countryLabel.text = self.country
        self.cityLabel.text = self.city
        self.imgView.image = UIImage(named: "\(IATA).jpg")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
