//
//  UIButton.swift
//  IOS8 - HW11 - Garitskiy Victor
//
//  Created by Victor Garitskyu on 29.12.2022.
//

import UIKit

extension UIButton {
    func addtIcon(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)

        let length = CGFloat(15)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: self.titleLabel!.leadingAnchor, constant: -35),
            imageView.centerYAnchor.constraint(equalTo: self.titleLabel!.centerYAnchor, constant: 0),
            imageView.widthAnchor.constraint(equalToConstant: length),
            imageView.heightAnchor.constraint(equalToConstant: length)
        ])
    }
}
