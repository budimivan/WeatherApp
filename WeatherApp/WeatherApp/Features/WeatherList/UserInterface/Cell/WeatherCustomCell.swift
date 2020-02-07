//
//  WeatherCustomCell.swift
//  WeatherApp
//
//  Created by Ivan Budim on 07/02/2020.
//  Copyright © 2020 Ivan Budim. All rights reserved.
//

import UIKit

class WeatherCustomCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var currentTemparature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool,
                              animated: Bool)
    {
        super.setSelected(selected,
                          animated: animated)
    }
}
