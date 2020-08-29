//
//  ViewController.swift
//  location-app
//
//  Created by AMcom on 28/06/20.
//  Copyright © 2020 Felipe Santos. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var lbLatitude: UILabel!
    @IBOutlet weak var lbLongitude: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestUserPermissionLocation()
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 50
        locationManager.showsBackgroundLocationIndicator = true
    }
    
    func updateUi(lat: String, long: String){
        print("atualizou a tela")
        lbLatitude.text = lat
        lbLongitude.text = long
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)

        lbTime.text = "\(hour):\(minutes):\(seconds)"
    }
    
    func requestUserPermissionLocation(){
        if CLLocationManager.locationServicesEnabled(){
            switch CLLocationManager.authorizationStatus(){
            case .authorizedAlways, .authorizedWhenInUse:
                print("LocationManager Permission: Tem permissão")
                break
            case .denied:
                print("LocationManager Permission: Negada")
                break
            case .notDetermined:
                print("LocationManager Permission: Não tem permissão, solicitar")
                locationManager.requestAlwaysAuthorization()
            case .restricted:
                print("LocationManager Permission: Restrita")
                break
            @unknown default:
                print("LocationManager Permission: erro")
                break
            }
        }
    }

}

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("LocationManager didChangeLocationStatus: FUNCIONOU!")
            self.locationManager.startUpdatingLocation()
            break
        default:
            print("LocationManager didChangeLocationStatus: erro")
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        self.updateUi(lat: "\(locValue.latitude)", long: "\(locValue.longitude)")
        
        LastMileApi.sendLocation(accessToken: "56b27bad-12b5-3bf7-b234-91134b69d8eb", tokenClient: "wGCiRn4eHd-lBsJ3oFFUJQnpIt8tKC", lat: "\(locValue.latitude)", long: "\(locValue.longitude)", onUserDeconected: {(desconected) in if desconected {
            self.locationManager.stopUpdatingLocation()
            }})
        {(success) in }
}

}

