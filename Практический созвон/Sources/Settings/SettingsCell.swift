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
                customSwitch.isHidden = ((model?.isSwitch) == nil)
            }
        }

    //    MARK: - UI

        private lazy var customView: UIView = {
            let view = UIView()
            view.layer.cornerRadius = 25
            view.backgroundColor = .systemGray6
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        private lazy var customImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = .systemGray4
            imageView.contentMode = .scaleAspectFit
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

        private lazy var customTitleLabel: UILabel = {
            let label = UILabel()
            label.textAlignment = .left
            label.font = UIFont(name: "GTWalsheimPro-Bold", size: 18)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()

    private lazy var customDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .systemGray2
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var customVerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .systemGray2
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        view.thumbBackgroundColor = .systemGray6
//        view.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
        view.thumbOnTintColor = UIColor(named: "PinkButton") ?? .systemPink
        view.isOn = model?.isSwitch ?? true
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

    NSLayoutConstraint.activate([
                customView.leadingAnchor.constraint(equalTo: leadingAnchor),
                customView.centerYAnchor.constraint(equalTo: centerYAnchor),
                customView.heightAnchor.constraint(equalToConstant: 48),
                customView.widthAnchor.constraint(equalToConstant: 48),

                customImageView.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
                customImageView.centerXAnchor.constraint(equalTo: customView.centerXAnchor),
                customImageView.heightAnchor.constraint(equalToConstant: 24),

                customTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
                customTitleLabel.leadingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 19),

                customDiscriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 20),
                customDiscriptionLabel.leadingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 19),

                customSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
                customSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
                customSwitch.heightAnchor.constraint(equalToConstant: 30),
                customSwitch.widthAnchor.constraint(equalToConstant: 50),

                customVerLabel.bottomAnchor.constraint(equalTo: customTitleLabel.bottomAnchor),
                customVerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
                ])
//        customView.snp.makeConstraints { make in
//            make.leading.equalTo(snp.leading)
//            make.centerY.equalTo(snp.centerY)
//            make.height.width.equalTo(48)
//        }
//
//        customImageView.snp.makeConstraints { make in
//            make.centerX.centerY.equalTo(customView)
//            make.width.height.equalTo(24)
//        }
//
//        customTitleLabel.snp.makeConstraints { make in
//            make.trailing.equalTo(customView).inset(19)
//            make.centerY.equalToSuperview().offset(-5)
//        }
//
//        customDiscriptionLabel.snp.makeConstraints { make in
//            make.trailing.equalTo(customView).inset(19)
//            make.centerY.equalToSuperview().offset(5)
//        }
//
//        customSwitch.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.centerY.equalToSuperview()
//        }
//
//        customVerLabel.snp.makeConstraints { make in
//            make.leading.equalToSuperview()
//            make.centerY.equalToSuperview().offset(-5)
//        }

        }


}
