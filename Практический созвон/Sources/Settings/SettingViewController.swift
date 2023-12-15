//
//  SettingViewController.swift
//  Практический созвон
//
//  Created by Христина Буянова on 18.11.2023.
//

import UIKit

class SettingViewController: UIViewController {

    private var model = Model.array

        // MARK: - Outlets

    private lazy var whiteView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        view.layer.cornerRadius = 25
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
        view.layer.shadowRadius = 36
        view.backgroundColor = .white
        return view
    }()

    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.textColor = .black
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var pinkView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.backgroundColor = UIColor(named: "PinkButton")
        view.layer.cornerRadius = 20
        return view
    }()

    private lazy var bell: UIImageView = {
        let view = UIImageView(image: UIImage(named: "bell"))
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    private lazy var bigLabel: UILabel = {
        let label = UILabel()
        label.text = "Turn on notification"
        label.textColor = .white
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 21)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.text = "Update your settings"
        label.textColor = .white
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 12)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

        private lazy var tableView: UITableView = {
            let tableView = UITableView(frame: .zero, style: .insetGrouped)
            tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
            tableView.dataSource = self
            tableView.delegate = self
            return tableView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupHierrarchy()
        setupLayout()

    }

    // MARK: - Setup
    private func setupView() {
        view.backgroundColor = .white
        let backButton = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "GTWalsheimPro-Bold", size: 24) ?? ""]
        navigationController?.navigationBar.backItem?.title = ""

    }

    private func setupHierrarchy() {
        view.addSubview(whiteView)
        view.addSubview(settingsLabel)
        view.addSubview(pinkView)
        view.addSubview(bell)
        view.addSubview(bigLabel)
        view.addSubview(smallLabel)
        view.addSubview(tableView)
    }

    private func setupLayout() {
        whiteView.snp.makeConstraints { make in
            make.top.equalTo(view)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(116)

        }
        pinkView.snp.makeConstraints { make in
            make.top.equalTo(whiteView.snp.bottom)
            make.height.equalTo(88)
            make.leading.trailing.equalTo(view).inset(25)
        }

        bell.snp.makeConstraints { make in
            make.height.width.equalTo(72)
            make.top.equalTo(pinkView.snp.top).offset(-10)
            make.trailing.equalTo(view.snp.trailing).inset(43)
        }

        settingsLabel.snp.makeConstraints { make in
            make.bottom.equalTo(whiteView.snp.bottom).offset(-29)
            make.leading.equalTo(view.snp.leading).inset(55)
        }

        smallLabel.snp.makeConstraints { make in
            make.leading.equalTo(pinkView.snp.leading).inset(25)
            make.top.equalTo(pinkView.snp.top).inset(20)
        }

        bigLabel.snp.makeConstraints { make in
            make.leading.equalTo(pinkView.snp.leading).inset(25)
            make.top.equalTo(pinkView.snp.top).inset(42)
        }

        tableView.snp.makeConstraints { make in
            make.leading.equalTo(view.snp.leading).inset(25)
            make.trailing.equalTo(view.snp.trailing).inset(25)
            make.top.equalTo(pinkView.snp.bottom).inset(40)
        }

    }

}

// MARK: - Extension

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            let modelData = model[indexPath.row]
            print("Нажата ячейка \(modelData.title)")
        }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let modelData = model[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as? SettingsCell
        cell?.model = modelData
        return cell ?? UITableViewCell()
    }
}


