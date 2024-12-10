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

    private var dataSource = [PhoneBook]()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "친구 목록"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()

    lazy var addButton: UIButton = {
        let button = UIButton()
        button.setTitle("추가", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()

    lazy var phonbookListTableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PhoneBookListTableViewCell.self, forCellReuseIdentifier: PhoneBookListTableViewCell.id)
        return tableView
    }()

    // MARK: - 초기 설정

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        guard let dataSource = PhoneBookDataManager.shared.readAllData() else { return }
        self.dataSource = dataSource
        phonbookListTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {
        view.backgroundColor = .white
        
        [titleLabel, addButton, phonbookListTableView].forEach {
            view.addSubview($0)
        }

        let safeArea = view.safeAreaLayoutGuide

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).inset(20)
            $0.centerX.equalToSuperview()
        }

        addButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel.snp.centerY)
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
        return dataSource.count
    }

    // tableView 셀 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhoneBookListTableViewCell.id, for: indexPath) as? PhoneBookListTableViewCell else { return UITableViewCell() }

        cell.configure(dataSource[indexPath.row])

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

// MARK: - 버튼 클리식 실행

extension ViewController {

    @objc
    func buttonTapped() {
        self.navigationController?.pushViewController(PhoneBookViewController(), animated: true)
    }
}

#Preview {
    ViewController()
}
