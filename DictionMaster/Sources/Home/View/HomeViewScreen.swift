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
        button.backgroundColor = UIColor(hex: "#91A9B1", alpha: 0.1) // Opacidade de 10%
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
        textfield.placeholder = "Type a word..."
        textfield.textAlignment = .center
        let customFont = UIFont(name: "SFProRounded", size: 32)
        textfield.font = customFont
        return textfield
    }()
    
    
    override func addSubviews() {
        addSubview(languageButton)
        languageButton.addSubview(buttonTitle)
        languageButton.addSubview(iconLanguage)
        addSubview(typeWordField)
    }
    
    override func setupConstrainst() {
        languageButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(55)
            make.centerX.equalToSuperview()
            make.width.equalTo(137)
            make.height.equalTo(40)
        }
        buttonTitle.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(languageButton.snp.trailing).inset(15)
        }
        iconLanguage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(languageButton.snp.leading).inset(15)
        }
        typeWordField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(269)
            make.centerX.equalToSuperview()
            make.width.equalTo(184)
            make.height.equalTo(38)
        }
        
    }
}