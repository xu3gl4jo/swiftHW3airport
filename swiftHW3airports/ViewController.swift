//
//  ViewController.swift
//  swiftHW3airports
//
//  Created by 李紹威 on 2017/5/30.
//  Copyright © 2017年 李紹威. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    struct objects {
        var sectionName : String!
        var sectionObjects : [String]!
        
    }
    
    var objectArray = [objects]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        objectArray = [objects(sectionName:"section 1",sectionObjects:["a","b","c","d "])]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt index: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"Cell") as UITableViewCell!
        
        cell?.textLabel!.text = objectArray[index.section].sectionObjects[index.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return objectArray[section].sectionObjects.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return objectArray.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return objectArray[section].sectionName
    }

}


















  
