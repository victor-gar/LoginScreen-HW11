//
//  ViewController.swift
//  IOS8 - HW11 - Garitskiy Victor
//
//  Created by Victor Garitskyu on 29.12.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var labelLoginText: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textColor = UIColor.white
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.text = "Login"
        textField.textColor = .lightGray
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.setLeftIcon(UIImage(systemName: "person.fill")!)
        return textField
    }()
    
    private lazy var passTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 20
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.text = "Password"
        textField.textColor = .lightGray
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.setLeftIcon(UIImage(systemName: "lock.fill")!)
        return textField
    }()
    
    private lazy var buttonLogin: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 100/255, green: 116/255, blue: 201/255, alpha: 1.0)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        button.addTarget(self, action: #selector(test), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonForgotPass: UIButton = {
        let button = UIButton()
        button.setTitle("", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .bold)
        return button
    }()
    
    let labelConnect: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.text = "qr connect with"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return label
    }()
    
    private lazy var buttonHaveAccount: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dont have account?", for: .normal)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return button
    }()
    
    private lazy var buttonSignUp: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(UIColor(red: 100/255, green: 116/255, blue: 201/255, alpha: 1.0), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        return button
    }()
    
    private lazy var leftline: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    private lazy var rightline: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lightGray
        return line
    }()
    
    private lazy var stackViewSign: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.distribution = .equalCentering
        [self.buttonHaveAccount,
         self.buttonSignUp].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    private lazy var buttonTwitter: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 100/255, green: 116/255, blue: 201/255, alpha: 1.0)
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.addtIcon(image: UIImage(named: "twitter.png")!)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return button
    }()
    
    private lazy var buttonFacebook: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 59/255, green: 154/255, blue: 222/255, alpha: 1.0)
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.2
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.addtIcon(image: UIImage(named: "facebook.png")!)
        return button
    }()
    
    private lazy var stackViewSocialButton: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 15
        [self.buttonFacebook,
         self.buttonTwitter].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    let customView = CustomView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds
        
        view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        gradientForm()
        activate()
        view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        customView.snp.makeConstraints { make in
            make.height.equalTo(view)
            make.width.equalTo(view)
            make.center.equalTo(view)
        }
        
        labelLoginText.snp.makeConstraints { make in
            make.top.equalTo(view).offset(90)
            make.centerX.equalTo(view)
        }
        
        loginTextField.snp.makeConstraints { make in
            make.top.equalTo(labelLoginText.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 280, height: 40))
        }
        
        passTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTextField.snp.bottom).offset(10)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 280, height: 40))
        }
        
        buttonLogin.snp.makeConstraints { make in
            make.top.equalTo(passTextField.snp.bottom).offset(40)
            make.centerX.equalTo(view)
            make.size.equalTo(CGSize(width: 280, height: 45))
        }
        
        buttonForgotPass.snp.makeConstraints { make in
            make.top.equalTo(buttonLogin.snp.bottom).offset(10)
            make.centerX.equalTo(view)
        }
        
        labelConnect.snp.makeConstraints { make in
            make.top.equalTo(buttonForgotPass.snp.bottom).offset(280)
            make.centerX.equalTo(view)
        }
        
        leftline.snp.makeConstraints { make in
            make.top.equalTo(labelConnect.snp.bottom).offset(-7)
            make.left.equalTo(buttonLogin.snp.left)
            make.size.equalTo(CGSize(width: 80, height: 0.3))
        }
        
        rightline.snp.makeConstraints { make in
            make.top.equalTo(labelConnect.snp.bottom).offset(-7)
            make.right.equalTo(buttonLogin.snp.right)
            make.size.equalTo(CGSize(width: 80, height: 0.3))
        }
        
        stackViewSign.snp.makeConstraints { make in
            make.top.equalTo(labelConnect.snp.bottom).offset(100)
            make.centerX.equalTo(view)
        }
        
        stackViewSocialButton.snp.makeConstraints { make in
            make.top.equalTo(labelConnect.snp.bottom).offset(30)
            make.centerX.equalTo(view)
        }
        
        buttonFacebook.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 150, height: 40))
        }
        
        buttonTwitter.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 150, height: 40))
        }
        super.updateViewConstraints()
    }
    
    
    // MARK: - Setup
    func gradientForm() {
        let layer = CAGradientLayer()
        let bounds = UIScreen.main.bounds
        layer.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        layer.colors = [
            UIColor(red: 210/255, green: 195/255, blue: 247/255, alpha: 1.0).cgColor,
            UIColor(red: 157/255, green: 194/255, blue: 247/255, alpha: 1.0).cgColor
        ]
        view.layer.addSublayer(layer)
    }
    
    func activate(){
        customView.addSubview(buttonLogin)
        customView.addSubview(passTextField)
        customView.addSubview(loginTextField)
        customView.addSubview(labelLoginText)
        customView.addSubview(buttonForgotPass)
        customView.addSubview(labelConnect)
        customView.addSubview(leftline)
        customView.addSubview(rightline)
        customView.addSubview(stackViewSocialButton)
        customView.addSubview(stackViewSign)
        view.addSubview(customView)
    }
    
    @objc func test() {
        if loginTextField.text == "Victor" && passTextField.text == "1" {
            loginTextField.setRightIcon(UIImage(systemName: "checkmark.circle.fill")!)
            buttonForgotPass.setTitle("You have entered valid user data.", for: .normal)
            buttonForgotPass.setTitleColor(UIColor.green, for: .normal)
        } else {
            buttonForgotPass.setTitle("Restore password?", for: .normal)
            buttonForgotPass.setTitleColor(UIColor.red, for: .normal)
        }
    }
    
}

// MARK: Custom View

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required  init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        let path: UIBezierPath = getPath()
        let shape = CAShapeLayer()
        
        shape.path = path.cgPath
        shape.lineWidth = 2.0
        shape.strokeColor = UIColor.clear.cgColor
        shape.fillColor = UIColor.white.cgColor
        shape.shadowColor = UIColor.black.cgColor
        shape.shadowOpacity = 0.1
        shape.shadowOffset = .zero
        shape.shadowRadius = 10
        shape.shouldRasterize = true
        shape.rasterizationScale = UIScreen.main.scale
        self.layer.addSublayer(shape)
    }
    
    func getPath() -> UIBezierPath {
        let path: UIBezierPath = UIBezierPath()
        let bounds = UIScreen.main.bounds
        
        path.move(to: CGPoint(x: 0, y: 1000))
        path.addLine(to: CGPoint(x: 0, y: 1000))
        path.addLine(to: CGPoint(x: 0, y: 600))
        path.addCurve(to: CGPoint(x: bounds.width + 100, y: 700),
                      controlPoint1: CGPoint(x: 200, y: 700),
                      controlPoint2: CGPoint(x: 350, y: 350))
        path.addLine(to: CGPoint(x: 500, y: 1000))
        path.close()
        return path
    }
}
