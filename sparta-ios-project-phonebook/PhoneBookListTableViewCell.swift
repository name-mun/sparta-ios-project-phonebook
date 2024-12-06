//
//  PhoneBookListTableViewCell.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/6/24.
//

import UIKit

final class PhoneBookListTableViewCell: UITableViewCell {

    // MARK: - 프로퍼티 생성

    static let id = "PhoneBookListTableViewCell"

    // MARK: - 초기화

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
