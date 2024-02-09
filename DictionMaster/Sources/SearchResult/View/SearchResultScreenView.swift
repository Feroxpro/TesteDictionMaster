//
//  SearchResultScreenView.swift
//  DictionMaster
//
//  Created by Felipe Henrique Domingos on 08/02/24.
//

import Foundation
import UIKit
import SnapKit


class SearchResultScreenView: BaseView {
    
    lazy var titleResultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.text = "Education"
        return label
    }()
    
    lazy var previewAudioButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: "#5BD6FD")
        button.layer.cornerRadius = 20
        
        let buttonImage = UIImage(named: "audio-speaker-on")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    
    override func addSubviews() {
        addSubview(titleResultLabel)
        addSubview(previewAudioButton)
    }
    
    override func setupConstrainst() {
        titleResultLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(28)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20.5)
        }
        
        previewAudioButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(95)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(20.5)
            make.height.equalTo(46)
            make.width.equalTo(46)
        }
    }
}
