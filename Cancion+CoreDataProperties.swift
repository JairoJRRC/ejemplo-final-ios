//
//  Cancion+CoreDataProperties.swift
//  
//
//  Created by DAMII on 27/06/18.
//
//

import Foundation
import CoreData


extension Cancion {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cancion> {
        return NSFetchRequest<Cancion>(entityName: "Cancion")
    }

    @NSManaged public var trackName: String?
    @NSManaged public var trackExplicitness: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var primaryGenreName: String?
    @NSManaged public var currency: String?
    @NSManaged public var country: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var artistName: String?
    @NSManaged public var trackPrice: Double
    @NSManaged public var trackNumber: Int16

}
