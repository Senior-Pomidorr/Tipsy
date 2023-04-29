//
//  ViewController.swift
//  Tipsy
//
//  Created by Daniil Kulikovskiy on 29.04.2023.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xD7F9EB)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x00B06B)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let discription: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
}

extension MainViewController {
    func layout() {
        view.addSubview(greenView)
        view.addSubview(discription)
        greenView.addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            
            discription.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            discription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            discription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            discription.heightAnchor.constraint(equalToConstant: 30),
            
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
        
        ])
        
    }
}
