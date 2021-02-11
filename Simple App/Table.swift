//
//  Stack.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class Table: UIView {
    
    private let title = AccessibleLabel(withTextStyle: .headline)
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        return stack
    }()

    init(withTheme theme: Theme) {
        super.init(frame: .zero)
        
        title.text = theme.title
        self.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(title)
        self.addSubview(stackView)
        Element.allCases.forEach {
            let view = ContainerView(withElement: $0, andTheme: theme)
            stackView.addArrangedSubview(view)
        }
        
        addConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("No implementation found for this element.")
    }
    
    private func addConstraints() {
        title.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                       constant: 10).isActive = true
        title.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                        constant: -10).isActive = true
        title.topAnchor.constraint(equalTo: self.topAnchor,
                                   constant: 10).isActive = true
        stackView.topAnchor.constraint(equalTo: title.bottomAnchor,
                                   constant: 20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: title.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                      constant: -10).isActive = true
    }
}
