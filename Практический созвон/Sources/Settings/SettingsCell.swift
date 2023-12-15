//
//  SettingsCell.swift
//  Практический созвон
//
//  Created by Христина Буянова on 18.11.2023.
//

import UIKit

class SettingsCell: UITableViewCell {

    static let identifier = "settingsCell"

    var model: Model? {
            didSet {
                customImageView.image = UIImage(named: model?.image ?? "")
                customTitleLabel.text = model?.title
                customDiscriptionLabel.text = model?.discription
                customVerLabel.text = model?.label
                
            }
        }

    //    MARK: - UI

        private lazy var customView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 150
            view.backgroundColor = .systemGray4
//            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private lazy var customImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFit
//            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private lazy var customTitleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont(name: "GTWalsheimPro-Bold", size: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private lazy var customDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var customVerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
//        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()



    private lazy var customSwitch: UIView = {
            let view = CustomSwitchView(frame: .zero)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.onTintColor = .systemGray4
            view.offTintColor = .systemGray4
            view.cornerRadius = 0.5
            view.thumbCornerRadius = 0.5
            view.thumbSize = .init(width: 30, height: 30)
            view.padding = 0
            view.thumbInPadding = 5
        view.thumbOnTintColor = UIColor(named: "PinkButton") ?? .systemPink
        if model?.isSwitch != nil {
            view.isOn = model?.isSwitch ?? true
        }
            return view
        }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        addSubview(customView)
        addSubview(customImageView)
        addSubview(customTitleLabel)
        addSubview(customDiscriptionLabel)
        addSubview(customVerLabel)
        addSubview(customSwitch)
        }

    private func setupLayout() {
        customView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.width.equalTo(48)
        }

        customImageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(customView)
            make.width.height.equalTo(24)
        }

        customTitleLabel.snp.makeConstraints { make in
            make.trailing.equalTo(customView).inset(19)
            make.centerY.equalToSuperview().offset(-5)
        }

        customDiscriptionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(customView).inset(19)
            make.centerY.equalToSuperview().offset(5)
        }

        customSwitch.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }

        customVerLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview().offset(-5)
        }

        }

}
