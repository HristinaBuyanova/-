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
        pageControl.numberOfPages = 3
        pageControl.currentPageIndicatorTintColor = UIColor(named: "PinkButton")
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    private lazy var squareShadow: UIView = {
        let view = UIView()
        view.clipsToBounds = false
//        view.frame = CGRect(x: 0, y: 0, width: 345, height: 270)
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
        label.textColor = .black
        label.font = UIFont(name: "GTWalsheimPro-Bold", size: 24)
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.text = "Portland ugh fashion axe Helvetica. Echo Park Austin gastropub roof party."
        label.textColor = .systemGray
        label.font = UIFont(name: "GTWalsheimPro-Regular", size: 14)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "PinkButton")
        button.setTitle("I'm interested", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
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
        view.addSubview(bigLabel)
        view.addSubview(smallLabel)
        view.addSubview(button)
        view.addSubview(pageControl)
    }

    private func setupLayout() {
        picture.snp.makeConstraints { make in
//            make.centerX.equalTo(view)
            make.left.equalToSuperview().inset(88)
            make.right.equalToSuperview().inset(87)
            make.top.equalToSuperview().inset(139)
            make.height.equalTo(230)
            make.width.equalTo(200)
//            make.bottom.equalTo(view).offset(-443)
        }

        squareShadow.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(view).offset(511)
            make.bottom.equalTo(view).offset(-31)
//            make.height.equalTo(270)
//            make.width.equalTo(345)
        }

        bigLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(squareShadow).offset(83.5)
            make.right.equalTo(squareShadow).offset(-82.5)
            make.top.equalTo(squareShadow).offset(34.5)
            make.bottom.equalTo(squareShadow).offset(-207.5)
        }

        smallLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(squareShadow).offset(29)
            make.right.equalTo(squareShadow).offset(-29)
            make.top.equalTo(squareShadow).offset(80.5)
            make.bottom.equalTo(squareShadow).offset(-143.5)
        }

        button.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.left.equalTo(squareShadow).offset(45)
            make.right.equalTo(squareShadow).offset(-45)
            make.bottom.equalTo(squareShadow).offset(-45)
            make.height.equalTo(48)
        }

        pageControl.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(view).offset(472)
        }
    }

    // MARK: - Actions

    // MARK: - Extension

}

