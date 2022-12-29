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
    
    
    let customView = CustomView()
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds

        view.frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        gradientForm()
        view.setNeedsUpdateConstraints()
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
