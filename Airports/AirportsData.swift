//
//  AppDelegate.swift
//  hw3AirportList
//
//  Created by 李紹威 on 2017/5/29.
//  Copyright © 2017年 李紹威. All rights reserved.
//

import Foundation

struct AirportsData {
    var airport: String
    var country: String
    var IATA: String
    var city: String
    
    static func getAirportList() -> [[String: String]] {
        let filePath = Bundle.main.path(forResource: "airports", ofType: "plist")
        
        let items = NSArray(contentsOfFile: filePath!) as! [[String: String]]
        
        return items
    }
    
    static func airportList(in country: String) -> [[String: String]] {
        let airports = getAirportList()
        var airport = [[String:String]]()
        
        for airportElement in airports {
            if  airportElement["Country"] == country {
                airport.append(airportElement)
            }
        }
        return airport
    }
    
    static func countryList() -> [String] {
        let airports = getAirportList()
        var countries = [String]()
        
        for airport in airports {
            if !countries.contains(airport["Country"]!) {
                countries.append(airport["Country"]!)
            }
        }
        
        return countries
    }

    func open(_ airport: String) -> AirportsData? {
        let airportList = AirportsData.getAirportList()
        var city: String = ""
        var IATA: String = ""
        var country: String = ""
        
        for airportElement in airportList {
            if airportElement["Airport"] == airport {
                city = airportElement["ServedCity"]!
                IATA = airportElement["IATA"]!
                country = airportElement["Country"]!
            }
        }
        
        return AirportsData(airport: airport, country: country, IATA: IATA, city: city)
    }
}
