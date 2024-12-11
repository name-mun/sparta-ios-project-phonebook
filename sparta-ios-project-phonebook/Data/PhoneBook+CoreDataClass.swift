//
//  PhoneBook+CoreDataClass.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/10/24.
//
//

import Foundation
import CoreData

@objc(PhoneBook)
public class PhoneBook: NSManagedObject {
    public static let className = "PhoneBook"
    public enum Key {
        static let id = "id"
        static let name = "name"
        static let phoneNumber = "phoneNumber"
        static let profileImage = "profileImage"
    }

}
