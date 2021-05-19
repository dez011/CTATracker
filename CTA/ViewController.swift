//
//  ViewController.swift
//  CTA
//
//  Created by miguelh on 4/30/21.
//

import UIKit
import MapKit
import CoreLocation

struct MyVariables {

    static var key = "ff25dab5b7814f4195544c1a924d9dd4"
    static var feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40890&outputType=JSON"
    static var stationClicked = blueLineStationList
   // static var blue = true

}



class ViewController: UIViewController, CLLocationManagerDelegate {
        
    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var currentLocationStr = "Current Location"
    private var stationDirection: [StationDirections] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 41.874324, longitude: -87.639754)

        mapView.delegate = self
        
        
        let stationoName = StationDirections(
          title: "Red: Monroe",
          locationName: "Red Line",
          lineName: "red",
            
            coordinate: CLLocationCoordinate2D(latitude: 41.880745, longitude: -87.627696))
        mapView.addAnnotation(stationoName)
       
        loadInitialData()
        mapView.addAnnotations(stationDirection)
        
    }
    
    override func viewDidAppear(_ animated: Bool){
        determineCurrentLocation()

    }
        
    
    func determineCurrentLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let mUserLocation:CLLocation = locations[0] as CLLocation
        let center = CLLocationCoordinate2D(latitude: mUserLocation.coordinate.latitude, longitude: mUserLocation.coordinate.longitude)
        let mRegion = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        mapView.setRegion(mRegion, animated: true)
                
        let mkAnnotation: MKPointAnnotation = MKPointAnnotation()
        mkAnnotation.coordinate = CLLocationCoordinate2DMake(mUserLocation.coordinate.latitude, mUserLocation.coordinate.longitude)
        mkAnnotation.title = self.setUsersClosestLocation(mLattitude: mUserLocation.coordinate.latitude, mLongitude: mUserLocation.coordinate.longitude)
        mapView.addAnnotation(mkAnnotation)
    }

    @IBAction func blueLineButton(_ sender: UIButton) {
        blue = true
        red = false
        
        print(blue)
        print(red)
    }
    
    @IBAction func redLineButton(_ sender: UIButton) {
        blue = false
        red = true
        print(blue)
        print(red)
    }
    
    func setUsersClosestLocation(mLattitude: CLLocationDegrees, mLongitude: CLLocationDegrees) -> String {
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: mLattitude, longitude: mLongitude)

        geoCoder.reverseGeocodeLocation(location) {
            (placemarks, error) -> Void in

            if let mPlacemark = placemarks{
                if let dict = mPlacemark[0].addressDictionary as? [String: Any]{
                    if let Name = dict["Name"] as? String{
                        if let City = dict["City"] as? String{
                            self.currentLocationStr = Name + ", " + City
                        }
                    }
                }
            }
        }
        return currentLocationStr
    }

    
    
    private func loadInitialData() {
      guard
        
        let fileName = Bundle.main.url(forResource: "Directions", withExtension: "geojson"),
        let artworkData = try? Data(contentsOf: fileName)
        

        else {
          return
        print("failed geojson")
      }

      do {
        let features = try MKGeoJSONDecoder()
          .decode(artworkData)
          .compactMap { $0 as? MKGeoJSONFeature }
        let validWorks = features.compactMap(StationDirections.init)
        stationDirection.append(contentsOf: validWorks)
      } catch {
        print(" error: \(error).")
      }
    }

}



extension ViewController: MKMapViewDelegate {
    func mapView(
      _ mapView: MKMapView,
      annotationView view: MKAnnotationView,
      calloutAccessoryControlTapped control: UIControl
    ) {
      guard let artwork = view.annotation as? StationDirections else {
        return
      }

      let launchOptions = [
        MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeWalking
      ]
      artwork.mapItem?.openInMaps(launchOptions: launchOptions)
    }

  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    guard let annotation = annotation as? StationDirections else {
      return nil
    }
    let identifier = "stationName"
    var view: MKMarkerAnnotationView
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
}
