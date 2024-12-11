//
//  PhoneBook+CoreDataProperties.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/10/24.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var phoneNumber: String?
    @NSManaged public var profileImage: String?

}

extension PhoneBook : Identifiable {

}
