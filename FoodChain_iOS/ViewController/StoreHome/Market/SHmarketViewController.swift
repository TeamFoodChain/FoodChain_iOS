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
    var flag = 0
    @IBOutlet weak var locationTV: UITableView!
    @IBOutlet weak var mapview: UIView!
    
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
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.561104, longitude: 126.994320)
        marker.isTappable = true
        marker.map = googleMaps
        marker.isTappable = true
        
        
        
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
        
        flag = 1
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
        if flag == 1{
        let cell  = tableView.dequeueReusableCell(withIdentifier: "infoCell") as! SHmarketTableViewCell
            return cell
            
        }
        else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell") as! DefaultTableViewCell
            
            return cell
            
        }
        
    }
    
    
    
}

