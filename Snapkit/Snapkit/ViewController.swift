//
//  ViewController.swift
//  Snapkit
//
//  Created by Matheus de Sousa Matos on 17/05/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    //Most elegant way of declaring objects in UIKIt so that the variables are lazy thus optimizing the process.
    private lazy var imageContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false //Se true cria restrições de layout.
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "house.fill")
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Example"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Description Example"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    //MARK: - Initial
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.addSubview(self.imageContentView)
        self.imageContentView.addSubview(self.imageView)
        self.view.addSubview(self.titleLabel)
        self.view.addSubview(self.descriptionLabel)
        
        //MARK: - Choose setup layout
        //self.setupLayoutTraditional()
        self.setupLayoutSnapKit()
    }
    
    /// Setup use to framework SnapKit
    func setupLayoutSnapKit(){
        //Use weak self whenever self is needed
        self.imageContentView.snp.makeConstraints { [weak self] (make) in guard let self = self else {return}
            make.leading.trailing.top.width.equalToSuperview()
            make.height.equalTo(self.imageContentView.snp.width)
        }
        
        self.imageView.snp.makeConstraints { [weak self] (make) in guard let self = self else {return}
            make.width.equalTo(self.imageContentView.snp.width).multipliedBy(0.5)
            make.height.equalTo(self.imageView.snp.width)
            make.center.equalTo(self.imageContentView.snp.center)
        }
        
        self.titleLabel.snp.makeConstraints { [weak self] (make) in guard let self = self else {return}
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.imageContentView.snp.bottom).offset(16)
        }
        
        self.descriptionLabel.snp.makeConstraints { [weak self] (make) in guard let self = self else {return}
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(16)
        }
    }
    
    /// Setup use to NSLayoutConstraint Base.
    func setupLayoutTraditional(){
        
        //Based on View
        NSLayoutConstraint.activate([
            self.imageContentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.imageContentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.imageContentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.imageContentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.imageContentView.heightAnchor.constraint(equalTo: self.imageContentView.widthAnchor)
        ])
        
        //Based on imageContentView
        NSLayoutConstraint.activate([
            self.imageView.widthAnchor.constraint(equalTo: self.imageContentView.widthAnchor, multiplier: 0.5),
            self.imageView.heightAnchor.constraint(equalTo: self.imageView.widthAnchor),
            self.imageView.centerXAnchor.constraint(equalTo: self.imageContentView.centerXAnchor),
            self.imageView.centerYAnchor.constraint(equalTo: self.imageContentView.centerYAnchor)
        ])
        
        //Based on height imageContentView
        NSLayoutConstraint.activate([
            self.titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.titleLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.titleLabel.topAnchor.constraint(equalTo: self.imageContentView.bottomAnchor, constant: 16)
        ])

        //Based on height do title label.
        NSLayoutConstraint.activate([
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.descriptionLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 16)
        ])
        
        
    }

}

//
