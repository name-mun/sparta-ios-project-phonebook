//
//  PhoneBookViewController.swift
//  sparta-ios-project-phonebook
//
//  Created by mun on 12/9/24.
//

import UIKit

import Alamofire
import SnapKit

class PhoneBookViewController: UIViewController {

    // MARK: - 프로퍼티 생성

    var prepareData: PhoneBook? // 테이블뷰셀에 대한 정보를 전달 받는 변수

    private var imageURL: String = ""

    private lazy var navRightItem: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "적용", style: .plain, target: self, action: #selector(navButtonTapped))
        return button
    }()

    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 1 
        image.layer.cornerRadius = 150 / 2
        image.clipsToBounds = true // 넘치는 영역 잘라냄
        return image
    }()

    private lazy var randomImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("랜덤 이미지 생성", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(buttopnTapped), for: .touchUpInside)
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

    let numberTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 15)
        textView.layer.cornerRadius = 10
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        return textView
    }()

    // MARK: - 초기 설정

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false

        // 전달 받은 데이터가 있으면 뷰에 띄움
        guard let data = prepareData else { return }
        nameTextView.text = data.name
        numberTextView.text = data.phoneNumber
        imageURL = data.profileImage!
        AF.request(data.profileImage!).responseData { response in
            if let data = response.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.profileImage.image = image
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigation()
        configureUI()
    }


    // MARK: - 네비게이션바 설정

    private func configureNavigation() {
        navigationItem.rightBarButtonItem = navRightItem

        if let data = prepareData {
            navigationItem.title = data.name
        } else {
            navigationItem.title = "연락처 추가"
        }
    }

    // MARK: - 레이아웃 설정

    private func configureUI() {

        view.backgroundColor = .white
        
        [profileImage, randomImageButton, nameTextView, numberTextView].forEach {
            view.addSubview($0)
        }

        let safeArea = view.safeAreaLayoutGuide

        profileImage.snp.makeConstraints {
            $0.top.equalTo(safeArea.snp.top).offset(20)
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

    // MARK: - API 연결

    private func GetData<T: Decodable>(url: URL, completion: @escaping (Result<T, AFError>) -> Void) {

        AF.request(url).responseDecodable(of: T.self) { response in
            completion(response.result)}
    }

    private func GetPocketmonImage() {
        let addPath = Int.random(in: 1...1000)
        let urlComponents = URLComponents(string: "https://pokeapi.co/api/v2/pokemon/\(addPath)")

        guard let url = urlComponents?.url else {
            print("잘못된 URL")
            return
        }

        GetData(url: url) { [weak self] (result: Result<PocketmonImageResult, AFError>) in
            guard let self else { return }

            switch result {
            case .success(let result):
                guard let imageUrl = URL(string: result.sprites.frontDefault) else { return }
                imageURL = result.sprites.frontDefault
                AF.request(imageUrl).responseData { response in
                    if let data = response.data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.profileImage.image = image
                        }
                    }
                }

            case . failure(let error):
                print("데이터 로드 실패: \(error)")
            }
        }
    }
}

// MARK: - 버튼 클릭 시 실행

extension PhoneBookViewController {
    @objc
    private func buttopnTapped() {
        GetPocketmonImage()
    }

    @objc
    private func navButtonTapped() {
        // prepareData가 있으면 update, 아니면 create
        if let data = prepareData {
            PhoneBookDataManager.shared.updateData(id: data.id!, name: nameTextView.text, phoneNumber: numberTextView.text, profileImage: imageURL)
        } else {
            PhoneBookDataManager.shared.createData(name: nameTextView.text, phoneNumber: numberTextView.text, profileImage: imageURL)
        }

        self.navigationController?.popViewController(animated: true)
    }
}

#Preview {
    PhoneBookViewController()
}
