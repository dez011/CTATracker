//
//  LinesTableViewController.swift
//  CTA
//
//  Created by miguelh on 5/14/21.
//

import UIKit

var x = 0
var blue = false
var red = false

struct blueStations {

    static var ohare = "40890"
    static var rosemont = "40820"
    static var cumberland = "40230"
    static var harlem = "40750"
    static var jeffersonPark = "41280"
    static var montrose = "41330"
    static var irvingPark = "40550"
    
}
class LinesTableViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        
        if blue{
            x = blueLineStationList.count
        }
        if red {
            x = redLineStationList.count
        }
        //return LineStationList.count
        return x
        
    }
    
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bluelinecell", for: indexPath)
        
        if blue {
        let station = blueLineStationList[indexPath.row]
        
        
        cell.textLabel?.text = station.name
        }
        
        if red {
            let station = redLineStationList[indexPath.row]
            cell.textLabel?.text = station.name
        }
        
        
        
        return cell
        
        
    }
    
    
    

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DestinationTableViewController
        
        if blue {
        if let indexPath = self.tableView.indexPathForSelectedRow{
            switch indexPath.row {
            case 0: //ohare

                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.ohare+"&outputType=JSON"
            case 1:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.rosemont+"&outputType=JSON"
            case 2:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.cumberland+"&outputType=JSON"
            case 3:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.harlem+"&outputType=JSON"
            case 4:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.jeffersonPark+"&outputType=JSON"
            case 5:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.montrose+"&outputType=JSON"
            case 6:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid="+blueStations.irvingPark+"&outputType=JSON"
            case 7:  //adison
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41240&outputType=JSON"
          
            case 8://Belmont
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40060&outputType=JSON"
            
            case 9: //Logan Square
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41020&outputType=JSON"
           
            case 10://California
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40570&outputType=JSON"
            
            case 11:  //Western
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40670&outputType=JSON"
          
            case 12:   //Damen
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40590&outputType=JSON"
         
            case 13:            //Division

                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40320&outputType=JSON"
            case 14:  //Chicago
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41410&outputType=JSON"
          
            case 15:     //Grand
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40490&outputType=JSON"
       
            case 16:  //Clark/Lake
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40380&outputType=JSON"
          
            case 17:     //Washington
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40370&outputType=JSON"
       
            case 18:  //Monroe
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40790&outputType=JSON"
          
            case 19://Jackson
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40070&outputType=JSON"
            
            case 20://LaSalle
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41340&outputType=JSON"
            
            case 21: //Clinton
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40430&outputType=JSON"
           
            case 22:
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40350&outputType=JSON"
                    //UIC-Halsted
            case 23:  //Racine
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40470&outputType=JSON"
          
            case 24: //Illinois Medical District
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40810&outputType=JSON"
           
            case 25: //Western
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40220&outputType=JSON"
           
            case 26: //Kedzie-Homan
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40250&outputType=JSON"
           
            case 27:  //Pulaski
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40920&outputType=JSON"
          
            case 28: //Cicero
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40970&outputType=JSON"
           
            case 29://Austin
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40010&outputType=JSON"
            
            case 30://Oak Park
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40180&outputType=JSON"
            
            case 31://Harlem
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40980&outputType=JSON"
            
            case 32: //Forest Park
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40390&outputType=JSON"
           
            default://Forest Park
                vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40390&outputType=JSON"
            
                }
            }
        }//if blue end
        
        
        if red{
            if let indexPath = self.tableView.indexPathForSelectedRow{
                switch indexPath.row {
                case 0: //Howard
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40900&outputType=JSON"

                case 1://Jarvis
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41190&outputType=JSON"

                case 2://Morse
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40100&outputType=JSON"

                case 3://Loyola
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41300&outputType=JSON"

                case 4://Granville
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40760&outputType=JSON"

                case 5: //Thorndale
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40880&outputType=JSON"
 
                case 6://Bryn Mawr
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41380&outputType=JSON"

                case 7://Berwyn
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40340&outputType=JSON"

                case 8://Argyle
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41200&outputType=JSON"

                case 9://Lawrence
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40770&outputType=JSON"

                case 10://Wilson
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40540&outputType=JSON"

                case 11://Sheridan
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40080&outputType=JSON"
   
                case 12://Addison
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41240&outputType=JSON"

                case 13://Belmont
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40060&outputType=JSON"

                case 14://Fullerton
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41220&outputType=JSON"

                case 15://North/Clybourn
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40650&outputType=JSON"

                case 16://Clark/Division
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40630&outputType=JSON"

                case 17: //Chicago
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41450&outputType=JSON"

                case 18://Grand
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40330&outputType=JSON"
 
                case 19://Lake
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41660&outputType=JSON"

                case 20://Monroe
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=41090&outputType=JSON"

                case 21://Jackson
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40560&outputType=JSON"

    
        
                default://Jackson
                    vc.feed = "http://lapi.transitchicago.com/api/1.0/ttarrivals.aspx?key="+MyVariables.key+"&mapid=40560&outputType=JSON"

                }
            }
        }
        
        
    }
}
