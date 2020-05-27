//
//  PlasesModel.swift
//  My plases
//
//  Created by liza on 05/10/2019.
//  Copyright © 2019 liza. All rights reserved.
//

import RealmSwift

class Place: Object {
   
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    @objc dynamic var date = Date()
    @objc dynamic var rating = 0.0
    
    
    //  Инициализатор класса  Place
    
    convenience init(name: String, location: String?, type: String?, imageData: Data?, rating: Double){
        self.init()
        self.name = name
        self.location = location
        self.type = type
        self.imageData = imageData
        self.rating = rating
    }
    
//    let restourantNames = [
//       "Балкан Гриль" , "Бочка" , "Вкусные истории" ,
//       "Дастархан" , "Индокитай" , "Классик" ,
//       "Шок" , "Bonsai" , "Burger Heroes" , "Kitchen" ,
//       "Love&Life" , "Morris Pub" , "Sherlock Holmes" , "Speak Easy"
//       ]
//     func savePlases()  {
//            
//        for place in restourantNames {
//            
//            let image = UIImage(named: place)
//            guard  let imageData = image?.pngData() else {
//                return
//            }
//            
//            let newPlace = Place()
//            
//            newPlace.name = place
//            newPlace.location = "Novosinirsk"
//            newPlace.type = "Restourant"
//            newPlace.imageData = imageData
//            
//            StorageManader.saveObject(newPlace)
//        }
//    }
}
