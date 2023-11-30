//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 02.11.2023.
//

import UIKit
import SnapKit

final class ProfileHeaderView: UIView {
    
    static let idHeader = "CustomHeader"
    
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "avatarImage")
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        return avatarImage
    }()

     private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.numberOfLines = 0
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.numberOfLines = 0
        return label
    }()

    private lazy var inputText: UITextField = {
        let inputText = UITextField()
        inputText.leftViewMode = .always
        inputText.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: inputText.frame.height)
        )
        inputText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        inputText.textColor = .black
        inputText.layer.cornerRadius = 12
        inputText.backgroundColor = .white
        inputText.layer.borderWidth = 1
        inputText.layer.borderColor = UIColor.black.cgColor
        inputText.placeholder = "Введите статус"
        inputText.clearButtonMode = .whileEditing
        return inputText
    }()

    private lazy var buttonShowStatus: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        return button
    }()
    
    private func buttonTarget() {
        buttonShowStatus.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard inputText.text?.isEmpty == false else { return }
        statusLabel.text = inputText.text
    }

    private func inputTarget() {
        inputText.addTarget(
            self,
            action: #selector(statusTextChanged),
            for: .editingChanged
        )
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        _ = textField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        buttonTarget()
        inputTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(avatarImage)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(inputText)
        addSubview(buttonShowStatus)
        
        avatarImage.snp.makeConstraints { make in
            make.top.left.equalTo(self).offset(16)
            make.width.height.equalTo(120)
        }
        
        fullNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(27)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(avatarImage.snp.right).offset(16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(avatarImage.snp.right).offset(16)
        }

        inputText.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(10)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(avatarImage.snp.right).offset(16)
            make.height.equalTo(40)
        }
        
        buttonShowStatus.snp.makeConstraints { make in
            make.top.equalTo(avatarImage.snp.bottom).offset(16)
            make.right.equalTo(self).offset(-16)
            make.left.equalTo(self).offset(16)
            make.height.equalTo(50)
        }
        
    }
    
}
