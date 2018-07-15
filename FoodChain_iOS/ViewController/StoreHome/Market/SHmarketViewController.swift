//
//  SHmarketViewController.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 4..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation


class SHmarketViewController: UIViewController , CLLocationManagerDelegate,GMSMapViewDelegate{
    
    
    
    var locationManager = CLLocationManager()
    var flag :Int = -1
    @IBOutlet weak var locationTV: UITableView!
    @IBOutlet weak var mapview: UIView!
    let marketManager =  StorehomeMainNM()
    var arouncmarker : AroundMarket?
    let googleMaps: GMSMapView! = GMSMapView.map(withFrame: CGRect(x: 0,y:0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.width), camera: GMSCameraPosition.camera(withLatitude: 37.561104, longitude: 126.994320, zoom: 15.0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib.init(nibName: "DefaultTableViewCell", bundle: nil)
        self.locationTV.register(nib, forCellReuseIdentifier: "defaultCell")
        
        locationTV.delegate = self
        locationTV.dataSource = self
        googleMaps.delegate = self
        locationTV.separatorColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        googleMaps.isMyLocationEnabled = true
        
        googleMaps.settings.zoomGestures = true
        googleMaps.settings.scrollGestures = true
        googleMaps.settings.allowScrollGesturesDuringRotateOrZoom = true
        
        
        googleMaps.accessibilityElementsHidden = false
        
        mapview.addSubview(googleMaps)
        
        //좌표 컨버팅 및 폴리라인 , 마커 그리기
       
        marketManager.arouncstoredata(token: UserDefaults.standard.string(forKey: "usertoken")!) { [weak self](result) in
            
            if result.message == "Success to Get Data"{
                print("서버연결은 되어있다")
                
                self?.arouncmarker = result
                
                self?.googleMaps.camera = GMSCameraPosition.camera(withLatitude: (result.data?.addr_lat)!, longitude: (result.data?.addr_long)!, zoom: 15.0)
                
                for i in 0..<(result.data?.markets?.count)!{

                    let marker = GMSMarker()
                    marker.position = CLLocationCoordinate2D(latitude: Double((result.data?.markets![i].mar_locate_lat)!), longitude: Double((result.data?.markets![i].mar_locate_long)!))
                    marker.isTappable = true
                    marker.map = self?.googleMaps
                    marker.layer.backgroundColor = #colorLiteral(red: 0.2158766389, green: 0.6043385863, blue: 0.4158287644, alpha: 1)

                }

        
                
            }
            else if result.message == "No Data"{
                let alertController = UIAlertController(title: "",message: "동네 주변 상품이 있는 마켓이 없습니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
                
            }
            else{
                let alertController = UIAlertController(title: "",message: "네트워크 문제입니다.", preferredStyle: UIAlertControllerStyle.alert)
                let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
                alertController.addAction(cancelButton)
                self?.present(alertController,animated: true,completion: nil)
                
            }
        }

        
        
        //그라데이션 뷰
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = googleMaps.bounds
        gradientLayer.colors = [
            UIColor.white.withAlphaComponent(0).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(1).cgColor,
            UIColor.white.withAlphaComponent(0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        googleMaps.layer.mask = gradientLayer
        
        
       
        
        
    }
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        
        let a = marker.position.latitude
        
        for i in 0..<(arouncmarker?.data?.markets?.count)!{
            
            
            if (arouncmarker?.data?.markets![i].mar_locate_lat == a){
                
                flag = i
                locationTV.reloadData()
            }
            
            
            
        }
        
        locationTV.reloadData()
        
        return true
    }
 

}
extension SHmarketViewController : UITableViewDelegate{
    
}
extension SHmarketViewController : UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { 
        if flag == -1{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! DefaultTableViewCell
            
            return cell
    
            
        }
        else{
            let cell  = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! SHmarketTableViewCell
            cell.marketAddressLB.text = arouncmarker?.data?.markets![flag].mar_addr
            cell.marketNameLB.text = arouncmarker?.data?.markets![flag].mar_name
            
            return cell
            
           
            
        }
        
    }
    
    
    
}

