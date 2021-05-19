//
//  TableViewController.swift
//  CTA
//
//  Created by miguelh on 5/14/21.
//



import UIKit


class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    enum SerializationError: Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    class Record {
        var trainLine : String = ""
        var arrTime : String = ""
        var destinationName: String = ""
        var startStationName: String = ""
        
    }

    var dataAvailable = false
    var trains : [Record] = []
    var hourData: [Record] = []


    // MARK: - Table view data source

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        for train in trains {
            train.trainLine = ""
            train.arrTime = ""
            train.destinationName = ""
            train.startStationName = ""
        }
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return dataAvailable ? trains.count : 15
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if (dataAvailable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LazyTableCell", for: indexPath)
            let currTrain = trains[indexPath.row]
            cell.textLabel?.text = currTrain.arrTime
            cell.detailTextLabel?.text = currTrain.trainLine
            return cell
        } else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceholderCell", for: indexPath)
            return cell
        }
        
    }

    func loadData() {
        
        guard let feedURL = URL(string: MyVariables.feed) else
        {

            return
        }
        
        let request = URLRequest(url: feedURL)
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            guard let data = data else {
                return
                
            }
            
            do {
                
                if let json =
                    try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                {
                    print(json)

                    guard let theFeed = json["ctatt"] as? [String:Any]
                    else { throw SerializationError.missing("ctatt")
                        
                    }

                    guard let routes = theFeed["eta"] as? [Any]
                    else { throw SerializationError.missing("eta")
                        
                    }
                    
                    for route in routes {
                        
                        
                        do {
                            if let currentRoute = route as? [String:Any]
                            {
                                guard let arrTime = currentRoute["arrT"] as? String else
                                {
                                    throw SerializationError.missing("arrival time")
                                }
                                guard let dest = currentRoute["destNm"] as? String else
                                {
                                    throw SerializationError.missing("end station")
                                }
                                
                                
                                let updatTracker = Record()
                                updatTracker.arrTime = arrTime
                                updatTracker.trainLine = dest
                                self.trains.append(updatTracker)
                            }
                        }
                        
                        
        
                        catch SerializationError.missing(let errmsg)
                        {
                            print("Missing \(errmsg)")
                        } catch SerializationError.invalid(let errmsg, let data)
                        {
                            print("Invalid \(errmsg): \(data)")
                        } catch let error as NSError
                        {
                            print(error.localizedDescription)
                        }
                    }
                    self.dataAvailable = true
                    DispatchQueue.main.async{
                        self.tableView.reloadData()
                    }
                    
                }
            } catch SerializationError.missing(let errmsg)
            {
                print("Missing \(errmsg)")
            } catch SerializationError.invalid(let errmsg, let data)
            {
                print("Invalid \(errmsg): \(data)")
            } catch let error as NSError
            {
                print(error.localizedDescription)
            }
        }.resume()
    }
    

}
