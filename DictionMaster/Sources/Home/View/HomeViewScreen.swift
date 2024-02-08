//
//  HomeView.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 06/02/24.
//

import UIKit
import SnapKit


class HomeViewScreen: BaseView {
    
    lazy var languageButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#91A9B1", alpha: 0.1)
        button.layer.cornerRadius = 20
        return button
    }()
    
    lazy var buttonTitle: UILabel = {
        let label = UILabel()
        label.text = "ENGLISH"
        label.textColor = UIColor(hex: "#052D39")
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var iconLanguage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "English")
        return image
    }()
    
    lazy var typeWordField: UITextField = {
        let textfield = UITextField()
        textfield.textAlignment = .center
        textfield.font = UIFont.systemFont(ofSize: 32)
        let placeholderText = "Type a word..."
        let placeholderAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor(hex: "#052D39", alpha: 0.5)        ]
        let attributedPlaceholder = NSAttributedString(string: placeholderText,
                                                       attributes: placeholderAttributes)
        textfield.attributedPlaceholder = attributedPlaceholder
        return textfield
    }()
    
    lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setTitle("SEARCH", for: .normal)
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(hex: "#5BD6FD")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    
    override func addSubviews() {
        addSubview(languageButton)
        languageButton.addSubview(iconLanguage)
        languageButton.addSubview(buttonTitle)
        addSubview(typeWordField)
        addSubview(searchButton)
    }
    
    override func setupConstrainst() {
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(55)
            make.centerX.equalToSuperview()
            make.width.equalTo(137)
            make.height.equalTo(40)
        }
        iconLanguage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(languageButton.snp.leading).inset(15)
        }
        buttonTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconLanguage.snp.trailing).offset(5)
        }
        typeWordField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(269)
            make.centerX.equalToSuperview()
            make.width.equalTo(204)
            make.height.equalTo(38)
        }
        searchButton.snp.makeConstraints { make in
            make.top.equalTo(typeWordField.snp.bottom).offset(128)
            make.centerX.equalToSuperview()
            make.width.equalTo(358)
            make.height.equalTo(64)
        }
    }
}
