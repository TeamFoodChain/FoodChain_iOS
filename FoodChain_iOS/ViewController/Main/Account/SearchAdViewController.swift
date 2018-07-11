//
//  SearchAdViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 11..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

protocol addressDelegate
{
    func Response(address: String , long:String ,lat:String)
}

class SearchAdViewController: UIViewController {

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var addressTV: UITableView!
    

    var jusoObject : [Juso] = []
    
    var jusocount :Int? = 0
    var delegate: addressDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressTV.delegate = self
        addressTV.dataSource = self
        
        addressTV.isHidden = true
        addressTF.setBottomBorder()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: self, action: #selector(JoinViewController.back(sender:)))
        
        newBackButton.setBackgroundImage(#imageLiteral(resourceName: "Back"), for: .normal, barMetrics: .default)
        self.navigationItem.leftBarButtonItem = newBackButton

        // Do any additional setup after loading the view.
    }

    @objc func back(sender: UIBarButtonItem) {
        
        
        
        navigationController?.popViewController(animated: true)
    }

    
    @IBAction func searchAction(_ sender: Any) {
        
        let searchAddressNM = SearchAddressNM()
        searchAddressNM.searchAD(keyword: gsno(addressTF.text)) { [weak self](searchAd) in
            
            if searchAd.results?.common?.errorCode == "-999"{
                self?.addressTV.isHidden = true
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else if  searchAd.results?.common?.errorCode == "E0005"{
                self?.addressTV.isHidden = true
                let alertController = UIAlertController(title: "",message: "주소를 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else if  searchAd.results?.common?.errorCode == "E0006"||searchAd.results?.common?.errorCode == "E0008"||searchAd.results?.common?.errorCode == "E0009"{
                self?.addressTV.isHidden = true
                let alertController = UIAlertController(title: "",message: "주소를 상세히 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
      
            }
            else if  searchAd.results?.common?.errorCode == "E0010"{
                 self?.addressTV.isHidden = true
                let alertController = UIAlertController(title: "",message: "주소가 너무 깁니다. 다시 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else
            { if  Int((searchAd.results?.common?.totalCount)!)! >= 100{
                 self?.addressTV.isHidden = true
                let alertController = UIAlertController(title: "",message: "주소를 상세히 입력해 주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                }
                
            else{
                self?.jusocount = self?.gino(searchAd.results?.juso?.count)
                self?.jusoObject = (searchAd.results?.juso)!
                self?.addressTV.isHidden = false
                self?.addressTV.reloadData()
                
                }
                
            }
            
        }
        
    }
    

}
extension SearchAdViewController: UITableViewDelegate{
    
}
extension SearchAdViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gino(jusocount)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "adsearchCell") as! SearchAdTableViewCell
        cell.addressLB.text = jusoObject[indexPath.row].roadAddr
        cell.addressLB.sizeToFit()
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    
        let add = gsno(jusoObject[indexPath.row].roadAddrPart1)
        let geoNM = SearchAddressNM()
       geoNM.geoconding(keyword: add ) { [weak self](geo) in
        
            self?.delegate?.Response(address:(self?.jusoObject[indexPath.row].roadAddrPart1)!, long:  String((geo.results?.first?.geometry?.location?.lng)!) , lat:   String((geo.results?.first?.geometry?.location?.lat)!))

         self?.navigationController?.popViewController(animated: true)
        }
        
       
        
      
       
    }
    
    
}
