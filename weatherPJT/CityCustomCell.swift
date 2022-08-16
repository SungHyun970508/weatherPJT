//
//  CityCustomCell.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/28.
//

import UIKit

class CityCustomCell: UITableViewCell {
    
    //MARK: - second cell properties
    @IBOutlet var weatherImg: UIImageView!
    @IBOutlet var cityName: UILabel!
    @IBOutlet var cityTemp: UILabel!
    @IBOutlet var rainPercent: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
