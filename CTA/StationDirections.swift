//
//  StationDirections.swift
//  CTA
//
//  Created by miguelh on 5/18/21.
//


import Foundation
import MapKit
import Contacts

class StationDirections: NSObject, MKAnnotation {
  let title: String?
  let locationName: String?
  let lineName: String?
  let coordinate: CLLocationCoordinate2D
  
  init(
    title: String?,
    locationName: String?,
    lineName: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.locationName = locationName
    self.lineName = lineName
    self.coordinate = coordinate
    
    super.init()
  }
  
  init?(feature: MKGeoJSONFeature) {
    guard
      let point = feature.geometry.first as? MKPointAnnotation,
      let propertiesData = feature.properties,
      let json = try? JSONSerialization.jsonObject(with: propertiesData),
      let properties = json as? [String: Any]
      else {
        return nil
    }
    
    title = properties["title"] as? String
    locationName = properties["location"] as? String
    lineName = properties["lineName"] as? String
    coordinate = point.coordinate
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
  
  var mapItem: MKMapItem? {

        
    let placemark = MKPlacemark(
      coordinate: coordinate,
      addressDictionary: nil)
    
    
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = title
    
    return mapItem
  }
  

  

} 
