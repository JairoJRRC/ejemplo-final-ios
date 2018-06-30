//
//  DataBaseManager.swift
//  coredatademo
//
//  Created by Docente801 on 18/02/17.
//  Copyright © 2017 Docente801. All rights reserved.
//

import Foundation
import MagicalRecord

class DataBaseManager {

    static let sharedInstance = DataBaseManager()
    
    
    func createCancion() -> Cancion {
        
        let c = Cancion.mr_createEntity()
        
        c?.artistName = ""
        c?.trackName = ""
        c?.artworkUrl100 = ""
        c?.trackPrice = 0
        c?.releaseDate = ""
        c?.trackExplicitness = ""
        c?.trackNumber = 0
        c?.country = ""
        c?.currency = ""
        c?.primaryGenreName = ""
        
        self.saveCancionDatBaseChanges()
        
        return c!
        
    }
    
    func getCancionArray() -> NSArray {
        let arr: NSArray = Cancion.mr_findAll()! as NSArray
        return arr
    }
    
    func getCancionByKey(attribute: String, value: AnyObject) -> Cancion {
        let a = Cancion.mr_find(byAttribute: attribute, withValue: value)
        
        return a![0] as! Cancion
    }
    
    func getGroupOfCancionesByKey(attribute: String, value: AnyObject) -> [AnyObject] {
        let p = Cancion.mr_find(byAttribute: attribute, withValue: value)
        
        return p!
    }

    
    func saveCancionDatBaseChanges(){
        NSManagedObjectContext.mr_default().mr_saveToPersistentStoreAndWait()
    }
    
    func deleteCancion(a:Cancion){
        a.mr_deleteEntity()
        self.saveCancionDatBaseChanges();
    }
    
    func deleteCancionTable(){
        Cancion.mr_truncateAll()
        self.saveCancionDatBaseChanges();
    }
}
