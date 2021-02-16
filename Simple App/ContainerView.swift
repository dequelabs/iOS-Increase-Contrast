//
//  ContainerView.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class ContainerView: UIView {
    
    let obj: UIView
    let label = AccessibleLabel()

    init(withElement element: Element, andTheme theme: Theme) {
        obj = element.create(withTheme: theme)
        
        super.init(frame: .zero)
        label.text = element.rawValue
        label.textColor = theme.textColor
        
        self.backgroundColor = theme.backgroundColor

        addSubview(label)
        addSubview(obj)
        
        addConstraints()
        
        if theme == .customTheme {
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(updateBorder),
                                                   name: UIAccessibility.darkerSystemColorsStatusDidChangeNotification,
                                                   object: nil)
            updateBorder()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("No initializer found for this element.")
    }
    
    private func addConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        obj.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                       constant: 10.0).isActive = true
        label.trailingAnchor.constraint(greaterThanOrEqualTo: obj.leadingAnchor,
                                        constant: 20.0).isActive = true
        label.centerYAnchor.constraint(equalTo: obj.centerYAnchor).isActive = true
        obj.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                      constant: -10.0).isActive = true
        obj.topAnchor.constraint(equalTo: self.topAnchor,
                                 constant: 10).isActive = true
        obj.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                    constant: -10).isActive = true
        obj.widthAnchor.constraint(lessThanOrEqualTo: self.widthAnchor,
                                   multiplier: 0.5).isActive = true
    }
    
    @objc
    private func updateBorder() {
        if UIAccessibility.isDarkerSystemColorsEnabled {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.darkGray.cgColor
        } else {
            self.layer.borderColor = UIColor.clear.cgColor
            self.layer.borderWidth = 0
        }
    }

}
