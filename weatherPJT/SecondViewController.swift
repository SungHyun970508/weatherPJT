//
//  SecondViewController.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/27.
//

import UIKit

class SecondViewController: UIViewController {

    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var selectedCountry: String?//현재 선택된 나라종류
    var weathers: [WeatherInfo] = []
    var assetName: String?
    var weatherImgURL: String?
    var states: [StateInformation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()
        print(assetName!)
        guard let dataAsset: NSDataAsset = NSDataAsset(name: assetName!) else {
            print("인코딩에러")
            return
        }
        
        do{
            self.weathers = try jsonDecoder.decode([WeatherInfo].self, from: dataAsset.data)
        } catch {
            print("인코딩에러")
            print(error.localizedDescription)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //내비게이션 탭 바 타이틀 변경
        self.navigationItem.title = self.selectedCountry
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

//MARK: - SecondView tableview methods
extension SecondViewController: UITableViewDataSource { // 인터페이스 빌더에서 뷰(컨트롤 클릭) 후 꼭 datasource와 뷰컨트롤러 연결해주기!!!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weathers.count//섹션의 테이블뷰에 표시될 셀의 개수 리턴
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CityCustomCell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityCustomCell
        let weather: WeatherInfo = self.weathers[indexPath.row]
        
        cell.cityName?.text = weather.cityName
        cell.cityTemp?.text = weather.celsiusAndFahrenheit
        cell.rainPercent?.text = weather.fullRainfallPro
        
        if let state = StateInformation.StateInforms(rawValue: weather.state) {
            weatherImgURL = state.imageURL
        } else {
            print("state is nil")
        }
        
        cell.weatherImg?.image = UIImage(named: weatherImgURL!)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextViewController: ThirdViewController =
            segue.destination as? ThirdViewController else {
            return
        }
        
        guard let cell: CityCustomCell = sender as? CityCustomCell else {
            return
        }
        if let selectedCellIndex = tableView.indexPathForSelectedRow?.row {
            let weather: WeatherInfo = self.weathers[selectedCellIndex]
            nextViewController.state = weather.state
        }
        nextViewController.backBtnTitle = self.selectedCountry
        nextViewController.navigationTitle = cell.cityName?.text
        nextViewController.temperatureText = cell.cityTemp?.text
        nextViewController.rainfallProbabilityText = cell.rainPercent?.text
    }
    
}


