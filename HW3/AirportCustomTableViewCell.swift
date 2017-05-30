//
//  Airportcustomtableviewcell.swift
//  HW3
//
//  Created by MacBook on 2017/5/30.
//  Copyright © 2017年 MacBook. All rights reserved.
//

import Foundation
import UIKit

class AirportCustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var AirportName: UILabel!
    @IBOutlet weak var CityCode: UILabel!
    @IBOutlet weak var CityName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
