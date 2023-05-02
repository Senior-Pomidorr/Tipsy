//
//  SecondViewController.swift
//  Tipsy
//
//  Created by Daniil Kulikovskiy on 30.04.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }
    
    private let greenView: UIView  = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(rgb: 0xD7F9EB)
        return view
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x00B06B)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recalculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.addTarget(self, action: #selector(backVc), for: .touchUpInside)
        return button
    }()
    
    @objc func backVc() {
        self.dismiss(animated: true)
    }
    
    private let totalPerPerson: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.font = .systemFont(ofSize: 30)
        label.textColor = .lightGray
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = UIColor(rgb: 0x00B06B)
        label.font = .boldSystemFont(ofSize: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let discription: UILabel = {
        let label = UILabel()
        label.text = "Split between 2 people, with 10% tip."
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

}

extension SecondViewController {
    
    func layout() {
        
        view.addSubview(greenView)
        view.addSubview(discription)
        view.addSubview(calculateButton)
        greenView.addSubview(totalPerPerson)
        greenView.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            
            greenView.topAnchor.constraint(equalTo: view.topAnchor),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 300),
            
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200),
            
            totalPerPerson.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            totalPerPerson.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 130),
            
            scoreLabel.topAnchor.constraint(equalTo: totalPerPerson.bottomAnchor, constant: 20),
            scoreLabel.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            
            discription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            discription.topAnchor.constraint(equalTo: greenView.bottomAnchor, constant: 40),
            discription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            discription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60),
        
        ])
    }
    
}
