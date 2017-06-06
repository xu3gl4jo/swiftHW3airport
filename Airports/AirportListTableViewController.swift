//
//  AppDelegate.swift
//  hw3AirportList
//
//  Created by 李紹威 on 2017/5/29.
//  Copyright © 2017年 李紹威. All rights reserved.
//
import UIKit

class AirportListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return AirportsData.countryList().count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let country = AirportsData.countryList()[section]
        
        return country
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let country = AirportsData.countryList()[section]
        let airport = AirportsData.airportList(in: country)
        
        let numberOfAirport = airport.count
        
        return numberOfAirport
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AirportCell", for: indexPath)
        
        cell.accessoryType = .disclosureIndicator
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let cityLabel = cell.viewWithTag(2) as! UILabel
        let iataLabel = cell.viewWithTag(3) as! UILabel
        
        let country = AirportsData.countryList()[indexPath.section]
        let airportDetal = AirportsData.airportList(in: country)
        
        let airport = airportDetal[indexPath.row]["Airport"]
        let city = airportDetal[indexPath.row]["ServedCity"]
        let IATA = airportDetal[indexPath.row]["IATA"]
        
        titleLabel.text = airport
        cityLabel.text = city
        iataLabel.text = IATA
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OpenAirport" {
            
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            print(indexPath.section)
            let country = AirportsData.countryList()[indexPath.section]
            let airportList = AirportsData.airportList(in: country)
            let airport = airportList[indexPath.row]
            
            let airportContentVC = segue.destination as! AirportContentViewController
            
            airportContentVC.airport = airport["Airport"]!
            airportContentVC.city = airport["ServedCity"]!
            airportContentVC.country = airport["Country"]!
            airportContentVC.IATA = airport["IATA"]!
            
        }
    }
}
