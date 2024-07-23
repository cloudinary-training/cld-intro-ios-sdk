//
//  AssetItems+CoreDataProperties.swift
//  Cloudinary_Academy_App
//
//  Created by Adi Mizrahi on 23/07/2024.
//

import Foundation
import CoreData


extension AssetItems {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AssetItems> {
        return NSFetchRequest<AssetItems>(entityName: "AssetItems")
    }

    @NSManaged public var deliveryType: String
    @NSManaged public var assetType: String
    @NSManaged public var transformation: String?
    @NSManaged public var publicId: String
    @NSManaged public var url: String

}

extension AssetItems : Identifiable {

}
