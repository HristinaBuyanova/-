//
//  ViewController.swift
//  Практический созвон
//
//  Created by Христина Буянова on 14.10.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Outlets

    private lazy var picture: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Card"))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        return pageControl
    }()

    private lazy var squareShadow: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.frame = CGRect(x: 0, y: 0, width: 345, height: 270)
        view.layer.cornerRadius = 20
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 12)
        view.layer.shadowRadius = 36
        view.backgroundColor = .white
        return view
    }()

    private lazy var bigLabel: UILabel = {
        let label = UILabel()
        label.text = "Keytar sweenet"
        label.textColor = UIColor(red: 0.108, green: 0.127, blue: 0.18, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        label.textColor = UIColor(red: 0.108, green: 0.127, blue: 0.18, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "PinkButton")
        button.setTitle("I'm interested", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.frame = CGRect(x: 0, y: 0, width: 255, height: 48)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()




    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        setupHierrarchy()
        setupLayout()
    }

    // MARK: - Setup
    private func setupView() {

    }

    private func setupHierrarchy() {
        view.addSubview(picture)
        view.addSubview(squareShadow)
    }

    private func setupLayout() {
        picture.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).offset(88)
            make.right.equalTo(view).offset(-87)
            make.top.equalTo(view).offset(139)
            make.bottom.equalTo(view).offset(-443)
        }

        squareShadow.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(view).offset(511)
            make.bottom.equalTo(view).offset(-31)
        }
    }

    // MARK: - Actions

    // MARK: - Extension

}

