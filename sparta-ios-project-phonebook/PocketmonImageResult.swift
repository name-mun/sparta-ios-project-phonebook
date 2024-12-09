//
//  PocketmonImageResult.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/9/24.
//

import Foundation

struct PocketmonImageResult: Codable {
    let sprites: Sprites

}

struct Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
