//
//  PhoneBookViewController.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/9/24.
//

import UIKit

import SnapKit

class PhoneBookViewController: UIViewController {

    // MARK: - 프러피티 생성

    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1 
        image.layer.cornerRadius = 150 / 2
        return image
    }()

    private let randomImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        return button
    }()

    private let nameTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()

    private let numberTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()

    // MARK: - 초기 설정

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {

        view.backgroundColor = .white
        
        [profileImage, randomImageButton, nameTextView, numberTextView].forEach {
            view.addSubview($0)
        }

        let safeArea = view.safeAreaLayoutGuide

        profileImage.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(10)
            $0.width.height.equalTo(150)
            $0.centerX.equalToSuperview()
        }

        randomImageButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        nameTextView.snp.makeConstraints {
            $0.top.equalTo(randomImageButton.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }

        numberTextView.snp.makeConstraints {
            $0.top.equalTo(nameTextView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }

    }
}

#Preview {
    PhoneBookViewController()
}
