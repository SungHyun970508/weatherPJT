//
//  ViewController.swift
//  weatherPJT
//
//  Created by SSG on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
   
    //MARK: - Properties
    let cellIdentifier: String = "countryCell"//
    var countries: [Country] = [] // contries 변수 선언
    var nextAssetName: String?

    //MARK: - funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let jsonDecoder: JSONDecoder = JSONDecoder()//디코더 선언 이후 데이터 에셋 불러오기
        guard let dataAsset: NSDataAsset = NSDataAsset(name: "countries") else {
            return
        }
        
        do{
            self.countries = try jsonDecoder.decode([Country].self, from: dataAsset.data)
        } catch {
            print(error.localizedDescription)
        }
    }

}

//MARK: - TableView methods
extension ViewController: UITableViewDataSource {
    
    //테이블뷰의 행의 개수 리턴 함수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countries.count // countries JSON 파일의 데이터 개수만큼 return
    }
    //테이블뷰의 로우에 해당되는 셀을 리턴
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let country: Country = self.countries[indexPath.row]
        let contryImg: UIImage = UIImage(named: "flag_" + country.assetName)!
        cell.imageView?.image = contryImg
        cell.textLabel?.text = country.koreanName
        self.nextAssetName = country.assetName
        
        return cell
    }
    
    
    //segue로 데이터 전달하기
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.\
        guard let nextViewController: SecondViewController =
            segue.destination as? SecondViewController else {
            return
        }
        
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
       
        nextViewController.selectedCountry = cell.textLabel?.text
        if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            let country: Country = self.countries[selectedIndex]
            print(country.assetName)
            nextViewController.assetName = country.assetName
        }
    }
}


