//
//  ViewController.swift
//  Tipsy
//
//  Created by Daniil Kulikovskiy on 29.04.2023.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    
    var labelNumber = 0
    var numberOfPeople = 1
    var tip = 0.10
    var calculateScore = 0.0
    var finalResult = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.delegate = self
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
        let labelScore = textField.text!
        let secondVc = SecondViewController()
        if !labelScore.isEmpty {
            calculateScore = Double(labelScore)!
            let result = calculateScore * tip / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
            secondVc.scoreLabel.text = finalResult
            secondVc.discription.text = "Split between \(numberOfPeople) people, with \(tip * 100)% tip."
            navigationController?.present(secondVc, animated: true)
        } else {
            secondVc.scoreLabel.text = "0"
            navigationController?.present(secondVc, animated: true)
            secondVc.discription.text = "Split between 1 people, with 10% tip."
        }
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
        text.textAlignment = .center
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
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 30
        return stackView
    }()
    
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("0%", for: .normal)
        button.setTitleColor(Color.green, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonCalculate), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("10%", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(rgb: 0x00B06B)
        button.addTarget(self, action: #selector(buttonCalculate), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonThree: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("20%", for: .normal)
        button.setTitleColor(Color.green, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 36)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(buttonCalculate), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonCalculate(_ sender: UIButton) {
        sender.isEnabled = false
        textField.endEditing(true)
        switch sender {
        case buttonOne:
            buttonTwo.isEnabled = true
            buttonThree.isEnabled = true
            sender.backgroundColor = Color.green
            sender.setTitleColor(.white, for: .normal)
            buttonTwo.backgroundColor = .clear
            buttonTwo.setTitleColor(UIColor(rgb: 0x00B06B), for: .normal)
            buttonThree.backgroundColor = .clear
            buttonThree.setTitleColor(Color.green, for: .normal)
            tip = 0.0
        case buttonTwo:
            buttonOne.isEnabled = true
            buttonThree.isEnabled = true
            sender.backgroundColor = Color.green
            sender.setTitleColor(.white, for: .normal)
            buttonOne.backgroundColor = .clear
            buttonOne.setTitleColor(UIColor(rgb: 0x00B06B), for: .normal)
            buttonThree.backgroundColor = .clear
            buttonThree.setTitleColor(Color.green, for: .normal)
            tip = 0.10
        case buttonThree:
            buttonOne.isEnabled = true
            buttonTwo.isEnabled = true
            sender.backgroundColor = Color.green
            sender.setTitleColor(.white, for: .normal)
            buttonOne.backgroundColor = .clear
            buttonOne.setTitleColor(UIColor(rgb: 0x00B06B), for: .normal)
            buttonTwo.backgroundColor = .clear
            buttonTwo.setTitleColor(Color.green, for: .normal)
            tip = 0.20
        default:
            break
        }
    }
    
    private let secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = UIColor(rgb: 0x00B06B)
        label.font = .systemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.addTarget(self, action: #selector(stepperTouch), for: .touchUpInside)
        return stepper
    }()
    
    @objc func stepperTouch() -> Int {
        numberOfPeople = Int(stepper.value)
        print(numberOfPeople)
        numberLabel.text = String(numberOfPeople)
        return numberOfPeople
    }
    
    
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet(charactersIn: "0123456789.").union(.whitespaces)
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
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
            //            buttonTwo.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            buttonTwo.widthAnchor.constraint(equalToConstant: buttonTwo.intrinsicContentSize.width),
            buttonTwo.heightAnchor.constraint(equalToConstant: 40),
            
            buttonOne.widthAnchor.constraint(equalToConstant: buttonOne.intrinsicContentSize.width),
            buttonOne.heightAnchor.constraint(equalToConstant: 40),
            
            buttonThree.widthAnchor.constraint(equalToConstant: buttonThree.intrinsicContentSize.width),
            buttonThree.heightAnchor.constraint(equalToConstant: 40),
        ])
        
        NSLayoutConstraint.activate([
            numberLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 110),
            stepper.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -80),
        ])
    }
}


