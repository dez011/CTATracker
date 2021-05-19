//
//  Locations.swift
//  CTA
//
//  Created by miguelh on 5/17/21.
//
import CoreLocation
import MapKit
import Foundation
// Your coordinates go here (lat, lon)
let geofenceRegionCenter = CLLocationCoordinate2DMake(37.33233141, -122.0312186)

let geofenceRegion = CLCircularRegion(center: geofenceRegionCenter,
                                      radius: 100,
                                      identifier: "UniqueIdentifier")
