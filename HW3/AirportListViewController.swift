//
//  AirportListViewController.swift
//  HW3
//
//  Created by MacBook on 2017/5/30.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import UIKit

class AirportListViewController: UITableViewController {

    var filePath: String!
    var airportList: [[[String: String]]] = []
    


    override func viewDidLoad() {
        super.viewDidLoad()
        var List : [[String: String]] = []
        filePath = Bundle.main.path(forResource: "Airports Data/airports", ofType: "plist")
        List = NSArray(contentsOfFile: filePath!) as! [[String : String]]

        for item in List {
            for no in 0...airportList.count{
                if no == airportList.count{
                    airportList.append([item])
                    break;
                }
                else if item["Country"] == airportList[no][0]["Country"]{
                    airportList[no].append(item)
                    break;
                }
            }
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return airportList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return airportList[section].count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return airportList[section][0]["Country"]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "airport", for: indexPath) as! AirportCustomTableViewCell
        
        cell.AirportName.text = airportList[indexPath.section][indexPath.row]["Airport"]
        cell.CityName.text = airportList[indexPath.section][indexPath.row]["ServedCity"]
        cell.CityCode.text = airportList[indexPath.section][indexPath.row]["IATA"]
        cell.CityCode.textColor = UIColor.gray
        cell.CityName.textColor = UIColor.gray
        return cell
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AirportDetailInfo" {
            guard let cell = sender as? UITableViewCell else {
                fatalError("Mis-configured storyboard! The sender should be a cell.")
            }
            self.prepareOpeningAiportDetailInfo(for: segue, sender: cell)
        } else {
            super.prepare(for: segue, sender: sender)
        }
    }
    
    
    func prepareOpeningAiportDetailInfo(for segue: UIStoryboardSegue, sender: UITableViewCell) {
        
        let Airportdetailviewcontroller = segue.destination as! AirportDetailViewController
        let senderIndexPath = self.tableView.indexPath(for: sender)!
        
        var dictemp : [String: String] = [:]
        dictemp["AirportName"] = airportList[senderIndexPath.section][senderIndexPath.row]["Airport"]
        dictemp["CountryName"] = airportList[senderIndexPath.section][senderIndexPath.row]["Country"]
        dictemp["CityName"] = airportList[senderIndexPath.section][senderIndexPath.row]["ServedCity"]
        dictemp["CityCode"] = airportList[senderIndexPath.section][senderIndexPath.row]["IATA"]
        
        Airportdetailviewcontroller.detailInfo = dictemp
    }


}
