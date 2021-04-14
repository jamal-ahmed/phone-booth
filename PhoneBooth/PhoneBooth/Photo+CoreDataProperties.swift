//
//  Photo+CoreDataProperties.swift
//  
//
//  Created by Jamal on 14/04/2021.
//
//

import Foundation
import CoreData


extension Photo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photo> {
        return NSFetchRequest<Photo>(entityName: "Photo")
    }

    @NSManaged public var timestamp: TimeInterval
    @NSManaged public var imageData: Data?
    @NSManaged public var imageName: String?
    @NSManaged public var id: UUID?

}
