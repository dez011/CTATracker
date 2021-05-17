//
//  Blueline.swift
//  CTA
//
//  Created by miguelh on 5/14/21.
//

import Foundation

//class theStationList {


let blueLineStationList = [
    
    BlueLine(name: "O'Hare"),
    BlueLine(name: "Rosemont"),
    BlueLine(name: "Cumberland"),
    BlueLine(name: "Harlem"),
    BlueLine(name: "Jefferson Park"),
    BlueLine(name: "Montrose"),
    BlueLine(name: "Irving Park"),
    BlueLine(name: "Addison"),
    BlueLine(name: "Belmont"),
    BlueLine(name: "Logan Square"),
    BlueLine(name: "California"),
    BlueLine(name: "Western"),
    BlueLine(name: "Damen"),
    BlueLine(name: "Division"),
    BlueLine(name: "Chicago"),
    BlueLine(name: "Grand"),
    BlueLine(name: "Clark/Lake"),
    BlueLine(name: "Washington"),
    BlueLine(name: "Monroe"),
    BlueLine(name: "Jackson"),
    BlueLine(name: "LaSalle"),
    BlueLine(name: "Clinton"),
    BlueLine(name: "UIC-Halsted"),
    BlueLine(name: "Racine"),
    BlueLine(name: "Illinois Medical District"),
    BlueLine(name: "Western"),
    BlueLine(name: "Kedzie-Homan"),
    BlueLine(name: "Pulaski"),
    BlueLine(name: "Cicero"),
    BlueLine(name: "Austin"),
    BlueLine(name: "Oak Park"),
    BlueLine(name: "Harlem"),
    BlueLine(name: "Forest Park"),
]


class BlueLine {
    var name: String
    init(name: String) {
        self.name = name
    }
}



let redLineStationList = [
    
    RedLine(name: "Howard"),
    RedLine(name: "Jarvis"),
    RedLine(name: "Morse"),
    RedLine(name: "Loyola"),
    RedLine(name: "Granville"),
    RedLine(name: "Thorndale"),
    RedLine(name: "Bryn Mawr"),
    RedLine(name: "Berwyn"),
    RedLine(name: "Argyle"),
    RedLine(name: "Lawrence"),
    RedLine(name: "Wilson"),
    RedLine(name: "Sheridan"),
    RedLine(name: "Addison"),
    RedLine(name: "Belmont"),
    RedLine(name: "Fullerton"),
    RedLine(name: "North/Clybourn"),
    RedLine(name: "Clark/Division"),
    RedLine(name: "Chicago"),
    RedLine(name: "Grand"),
    RedLine(name: "Lake"),
    RedLine(name: "Monroe"),
    RedLine(name: "Jackson"),
    RedLine(name: "Harrison"),
    RedLine(name: "Roosevelt"),
    RedLine(name: "Cermak-Chinatown"),
    RedLine(name: "Sox-35th"),
    RedLine(name: "47th"),
    RedLine(name: "Garfield"),
    RedLine(name: "63rd"),
    RedLine(name: "69th"),
    RedLine(name: "79th"),
    RedLine(name: "87th"),
    RedLine(name: "95th/Dan Ryan"),
]

class RedLine {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class stationsAll {
    var name: String
    init(name:String){
        self.name = name
    }
}

//}
