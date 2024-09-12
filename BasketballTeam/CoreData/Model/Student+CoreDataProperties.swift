//
//  Student+CoreDataProperties.swift
//  BasketballTeam
//
//  Created by Priyank Ahuja on 9/9/24.
//
//

import Foundation
import CoreData
import UIKit

extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var asuId: Int64
    @NSManaged public var image: UIImage?

}

extension Student : Identifiable {

}
