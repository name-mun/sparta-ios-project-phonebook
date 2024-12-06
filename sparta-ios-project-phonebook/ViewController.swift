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

    lazy var phonbookListTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .red
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhoneBookListTableViewCell.self, forCellReuseIdentifier: PhoneBookListTableViewCell.id)
        return tableView
    }()

    // MARK: - 초기 설정

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {
        [titleLabel, addButton, phonbookListTableView].forEach {
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

        phonbookListTableView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(25)
        }

    }
}

// MARK: - TableViewCell DataSource 설정

extension ViewController: UITableViewDataSource {
    // tableView 행 갯수 설정
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9 // 테스트 코드
    }

    // tableView 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneBookListTableViewCell.id, for: indexPath) as? PhoneBookListTableViewCell else { return UITableViewCell() }

        return cell
    }
}

// MARK: - TableViewCell Delegate 설정

extension ViewController: UITableViewDelegate {
    // tableView 행 높이 설정
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

#Preview {
    ViewController()
}
