//
//  UITextField.swift
//  IOS8 - HW11 - Garitskiy Victor
//
//  Created by Victor Garitskyu on 29.12.2022.
//

import UIKit

extension UITextField {
    func setLeftIcon (_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.tintColor = UIColor(red: 201/255, green: 201/255, blue: 201/255, alpha: 1.0)
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 15, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
    
    func setRightIcon (_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: -5, y: 5, width: 20, height: 20))
        iconView.tintColor = UIColor.green
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: -20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
