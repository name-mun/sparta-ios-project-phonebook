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

    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = 60 / 2
        image.backgroundColor = .white
        return image
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.text = "name"
        label.textColor = .black
        return label
    }()

    private let profileNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "010-0000-0000"
        label.textColor = .black
        return label
    }()

    // MARK: - 초기화

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {
        [profileImage, profileNameLabel, profileNumberLabel].forEach {
            self.addSubview($0)
        }

        profileImage.snp.makeConstraints {
            $0.leading.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }

        profileNameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(profileImage.snp.trailing).offset(20)
        }

        profileNumberLabel.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview().inset(10)
        }


    }

}
