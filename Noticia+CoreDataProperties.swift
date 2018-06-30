//
//  Noticia+CoreDataProperties.swift
//  
//
//  Created by Francisco Jose Sanchez Bao on 6/13/18.
//
//

import Foundation
import CoreData


extension Noticia {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Noticia> {
        return NSFetchRequest<Noticia>(entityName: "Noticia")
    }

    @NSManaged public var descriptionFoto: String?
    @NSManaged public var date: String?
    @NSManaged public var url: String?
    @NSManaged public var type: String?

}
