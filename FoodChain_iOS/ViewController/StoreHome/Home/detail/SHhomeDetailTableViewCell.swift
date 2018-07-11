//
//  SHhomeDetailTableViewCell.swift
//  FoodChain_iOS
//
//  Created by 신동규 on 2018. 7. 9..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class SHhomeDetailTableViewCell: UITableViewCell ,CLLocationManagerDelegate{
    
    
   
    @IBOutlet weak var shopImg: UIImageView!
    @IBOutlet weak var shopnameLB: UILabel!
    @IBOutlet weak var datenumLB: UILabel!
    @IBOutlet weak var adressLB: UILabel!
    @IBOutlet weak var distanceLB: UILabel!
    @IBOutlet weak var mapview: UIView!
    
  
    var googleMaps: GMSMapView!
   
    var locationManager = CLLocationManager()

    func showCurrentLocationOnMap() {
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
       
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.561104, longitude: 126.994320, zoom: 20.0)
     
        self.googleMaps = GMSMapView.map(withFrame: CGRect(x: mapview.frame.origin.x,y:mapview.frame.origin.y, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.width), camera: camera)
        
        self.googleMaps.isMyLocationEnabled = true
        self.googleMaps.isIndoorEnabled = true
        self.googleMaps.accessibilityElementsHidden = false
        self.googleMaps.camera = camera
        
        //좌표 컨버팅 및 폴리라인 , 마커 그리기
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.561104, longitude: 126.994320)
        marker.map = self.googleMaps
        self.googleMaps.settings.setAllGesturesEnabled(false)
      
        self.addSubview(self.googleMaps)
//     
        
        
//        let path = GMSMutablePath()
//        let polyline = GMSPolyline(path: path)
//        polyline.strokeWidth = 10.0
//        polyline.geodesic = true
//        polyline.map = self.googleMaps
        
       
    }
    
    override func awakeFromNib() {
     
            super.awakeFromNib()
            self.showCurrentLocationOnMap()
  
        


    
    }

 
    
}
