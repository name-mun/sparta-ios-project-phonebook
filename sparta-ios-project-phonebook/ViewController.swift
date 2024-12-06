//
//  ViewController.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/6/24.
//

import UIKit

import SnapKit

class ViewController: UIViewController {

    // MARK: - 프로퍼티 생성

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "친구 목록"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    let addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()

    // MARK: - 초기 설정

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {
        [titleLabel, addButton].forEach {
            view.addSubview($0)
        }

        let safeArea = view.safeAreaLayoutGuide

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).inset(20)
            $0.centerX.equalToSuperview()
        }

        addButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.top)
            $0.trailing.equalTo(safeArea.snp.trailing).inset(20)
            $0.height.equalTo(25)
        }

    }
}

#Preview {
    ViewController()
}
