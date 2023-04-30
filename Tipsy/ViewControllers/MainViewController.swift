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
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x00B06B)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Calculate", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 35)
        button.addTarget(self, action: #selector(pushCalcuteButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pushCalcuteButton() {
        let secondVc = SecondViewController()
        navigationController?.present(secondVc, animated: true)
    }
    
    private let discription: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "e.g. 123.56"
        text.font = .systemFont(ofSize: 40)
        text.textColor = .lightGray
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let selectedTipLAbel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.text = "Select tip"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chooseSplitLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25)
        label.textColor = .lightGray
        label.text = "Choose Split"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.spacing = 30
        return stackView
    }()
    
    
    private let buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x00B06B), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        return button
    }()
    
    private let buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(rgb: 0x00B06B)
        return button
    }()
    
    private let buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.setTitleColor(UIColor(rgb: 0x00B06B), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        return button
    }()
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.textColor = UIColor(rgb: 0x00B06B)
        label.font = .systemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
}

extension MainViewController {
    func layout() {
        view.addSubview(greenView)
        view.addSubview(discription)
        view.addSubview(textField)
        greenView.addSubview(calculateButton)
        greenView.addSubview(selectedTipLAbel)
        greenView.addSubview(stackView)
        greenView.addSubview(secondStackView)
        greenView.addSubview(chooseSplitLabel)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        secondStackView.addArrangedSubview(numberLabel)
        secondStackView.addArrangedSubview(stepper)
        
        NSLayoutConstraint.activate([
            
            discription.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            discription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            discription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            discription.heightAnchor.constraint(equalToConstant: 20),
            
            textField.topAnchor.constraint(equalTo: discription.bottomAnchor, constant: 30),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.bottomAnchor.constraint(equalTo: greenView.topAnchor, constant: -35),
            
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 220),
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            selectedTipLAbel.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 20),
            selectedTipLAbel.heightAnchor.constraint(equalToConstant: 30),
            selectedTipLAbel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 50),
            
            stackView.topAnchor.constraint(equalTo: selectedTipLAbel.bottomAnchor, constant: 18),
            stackView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor,  constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 70),
            
            chooseSplitLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            chooseSplitLabel.heightAnchor.constraint(equalToConstant: 30),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 50),
            
            secondStackView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 18),
            secondStackView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: 16),
            secondStackView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor,  constant: -16),
            secondStackView.heightAnchor.constraint(equalToConstant: 70),
        
            calculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 54),
            calculateButton.widthAnchor.constraint(equalToConstant: 200)
            
        ])
        
        NSLayoutConstraint.activate([
            buttonTwo.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            buttonTwo.widthAnchor.constraint(equalToConstant: 80),
            buttonTwo.heightAnchor.constraint(equalToConstant: 40),
            ])
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 110),
            stepper.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -80),
//            stepper.heightAnchor.constraint(equalToConstant: 40)
            ])
    }
}
