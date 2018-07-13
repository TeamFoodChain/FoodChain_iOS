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
    func Response(address: String , long:Double ,lat:Double)
}

class SearchAdViewController: UIViewController {
    
  
  
  
    var validation = 0 

    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var addressTV: UITableView!
    

    var jusoObject : [Juso] = []
    var flag = 0
    
    var jusocount :Int? = 0
    var delegate: addressDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addressTV.delegate = self
        addressTV.dataSource = self
        
      
        addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
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
                self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else if  searchAd.results?.common?.errorCode == "E0005"{
                self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                let alertController = UIAlertController(title: "",message: "주소를 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else if  searchAd.results?.common?.errorCode == "E0006"||searchAd.results?.common?.errorCode == "E0008"||searchAd.results?.common?.errorCode == "E0009"{
                self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                let alertController = UIAlertController(title: "",message: "주소를 상세히 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
      
            }
            else if  searchAd.results?.common?.errorCode == "E0010"{
                 self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                let alertController = UIAlertController(title: "",message: "주소가 너무 깁니다. 다시 입력해주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
            else
            { if  Int((searchAd.results?.common?.totalCount)!)! >= 100{
                 self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                let alertController = UIAlertController(title: "",message: "주소를 상세히 입력해 주세요.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                }
                
            else{
                self?.flag = 1
                self?.jusocount = self?.gino(searchAd.results?.juso?.count)
                self?.jusoObject = (searchAd.results?.juso)!
                self?.addressTV.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
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
         if jusoObject.isEmpty == true{
            return 1
            
         }else{
            return gino(jusocount)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if jusoObject.isEmpty == true{
            if flag == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "adsearchCell") as! SearchAdTableViewCell
            cell.addressLB.text = "주소에 대한 결과가 없습니다."
            cell.addressLB.sizeToFit()
            tableView.allowsSelection = false
            tableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                return cell
                
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "adsearchCell") as! SearchAdTableViewCell
                cell.addressLB.text = "주소를 입력해주세요"
                cell.addressLB.sizeToFit()
                tableView.allowsSelection = false
                tableView.separatorColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
                return cell
                
            }
            
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "adsearchCell") as! SearchAdTableViewCell
            cell.addressLB.text = jusoObject[indexPath.row].roadAddr
            cell.addressLB.sizeToFit()
            tableView.allowsSelection = true
            return cell
            
        }
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let geoNM = SearchAddressNM()
        let locate = LocateNM()

      
        if validation == 0{
        
        let add = gsno(jusoObject[indexPath.row].roadAddrPart1)
            
            geoNM.geoconding(keyword: add ) { [weak self](geo) in
                    self?.delegate?.Response(address:(self?.jusoObject[indexPath.row].roadAddrPart1)!, long:  (geo.results?.first?.geometry?.location?.lng)! , lat:   (geo.results?.first?.geometry?.location?.lat)!)
                    self?.navigationController?.popViewController(animated: true)
        
            }
            
        }
        else{
            validation = 0
            let add = gsno(jusoObject[indexPath.row].roadAddrPart1)
            
            geoNM.geoconding(keyword: add ) { [weak self](geo) in
                
                let geolong :Double = (geo.results?.first?.geometry?.location?.lng)!
                let geolat: Double = (geo.results?.first?.geometry?.location?.lat)!
            
                print(add)
               print(geolong)
                print(geolat)
                
                
                locate.locatesend(add: add, lat: geolat ,long: geolong, completion: { [weak self](locate) in
                    if locate.message == "Success to Register the Address"{
                        UserDefaults.standard.set(1,forKey: "selectlocation")
                        UserDefaults.standard.synchronize()
                         self?.navigationController?.popViewController(animated: true)
                    }
                    else{
                        let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                        let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                        alertController.addAction(cancelButton)
                        self?.present(alertController,animated: true,completion: nil)
                        
                    }
                })
                
                
            }
       
        
      
       
            }
            
        
    
    
    }
    
}
