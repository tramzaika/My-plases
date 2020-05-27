//
//  ViewController.swift
//  My plases
//
//  Created by liza on 28/09/2019.
//  Copyright © 2019 liza. All rights reserved.
//

import UIKit

class MainViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
   
    
    var places = Place.getPlases()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
       }
       
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = places[indexPath.row].name
        cell.locationLabel.text = places[indexPath.row].location
        cell.typeLabel.text = places[indexPath.row].type
        cell.imageOfPlace.image = UIImage(named: places[indexPath.row].restourantImage!)
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
       }
    
    @IBAction func unwindSegue(_ segue: UIStoryboardSegue){
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
        newPlaceVC.saveNewPlase()
        places.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
   
       
}

