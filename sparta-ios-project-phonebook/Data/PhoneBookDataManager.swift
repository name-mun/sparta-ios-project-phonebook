//
//  PhoneBookDataManager.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/10/24.
//

import CoreData
import UIKit

// PhoneBook 데이터 관리하는 클래스
class PhoneBookDataManager {

    static let shared = PhoneBookDataManager()

    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "PhoneBookModel")

        container.loadPersistentStores { _, error in
            if let error {
                fatalError("Failed to load persistent stores: \(error.localizedDescription)")
            }
        }
        return container
    }()

    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}

// MARK: - 데이터 CRUD

extension PhoneBookDataManager {
    // 변화 저장
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // 데이터 생성
    func createData(name: String, phoneNumber: String, profileImage: String) {
        guard let entity = NSEntityDescription.entity(forEntityName: PhoneBook.className, in: context) else { return }
        let newPhoneBook = NSManagedObject(entity: entity, insertInto: context)

        newPhoneBook.setValue(UUID(), forKey: PhoneBook.Key.id)
        newPhoneBook.setValue(name, forKey: PhoneBook.Key.name)
        newPhoneBook.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
        newPhoneBook.setValue(profileImage, forKey: PhoneBook.Key.profileImage)

        saveContext()

    }

    // 전체 데이터 읽기
    func readAllData() -> [PhoneBook]? {
        do {
            let phoneBooks = try
            context.fetch(PhoneBook.fetchRequest())

            for phoneBook in phoneBooks as [NSManagedObject] {
                if let name = phoneBook.value(forKey: PhoneBook.Key.name) as? String, let phoneNumber = phoneBook.value(forKey: PhoneBook.Key.phoneNumber) as? String, let profileImage = phoneBook.value(forKey: PhoneBook.Key.profileImage) as? String {
                }

                return phoneBooks
            }
        } catch {
            print("데이터 읽기 실패")
        }
        return nil
    }

    // 데이터 업데이트
    func updateData(id: UUID, name: String, phoneNumber: String, profileImage: String) {
        let fetchRequest = PhoneBook.fetchRequest()
        // id 값으로 데이터 검색
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            let result = try self.context.fetch(fetchRequest)

            for data in result as [NSManagedObject] {
                data.setValue(name, forKey: PhoneBook.Key.name)
                data.setValue(phoneNumber, forKey: PhoneBook.Key.phoneNumber)
                data.setValue(profileImage, forKey: PhoneBook.Key.profileImage)
            }

            try self.context.save()

            print("데이터 수정 성공")
        } catch {
            print("데이터 수정 실패")
        }
    }

    // 데이터 삭제
    func deleteData() {
        // TODO: -
    }
}
