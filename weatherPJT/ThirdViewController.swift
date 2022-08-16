//
//  ThirdViewController.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/28.
//

import UIKit

class ThirdViewController: UIViewController {
    //MARK: - Properties
    var backBtnTitle: String?
    var navigationTitle: String?
    var state: Int?
    var temperatureText: String?
    var rainfallProbabilityText: String?
    var imageURL: String?
    
    //MARK: - IBOutlet
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var rainfallProbabilityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var stateImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tempLabel.text = temperatureText
        rainfallProbabilityLabel.text = rainfallProbabilityText
       
        switch self.state {
        case 10:
            stateLabel.text = "맑음"
            imageURL = "sunny"
        case 11:
            stateLabel.text = "구름"
            imageURL = "cloudy"
        case 12:
            stateLabel.text = "비"
            imageURL = "rainy"
        case 13:
            stateLabel.text = "눈"
            imageURL = "snowy"
        default:
            stateLabel.text = nil
        }
        // Do any additional setup after loading the view.
        stateImageView.image = UIImage(named: imageURL!)
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //내비게이션 탭 바 타이틀 변경
        self.navigationItem.title = navigationTitle
        self.navigationItem.backButtonTitle = backBtnTitle
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
