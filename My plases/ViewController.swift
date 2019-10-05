//
//  ViewController.swift
//  My plases
//
//  Created by liza on 28/09/2019.
//  Copyright © 2019 liza. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
   
    let restourantNames = [
    "Балкан Гриль" , "Бочка" , "Вкусные истории" ,
    "Дастархан" , "Индокитай" , "Классик" ,
    "Шок" , "Bonsai" , "Burger Heroes" , "Kitchen" ,
    "Love&Life" , "Morris Pub" , "Sherlock Holmes" , "Speak Easy"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restourantNames.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.nameLabel.text = restourantNames[indexPath.row]
        cell.imageOfPlace.image = UIImage(named: restourantNames[indexPath.row])
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true
        
        return cell
       }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
       
}

