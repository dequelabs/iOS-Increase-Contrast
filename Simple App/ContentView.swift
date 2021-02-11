//
//  ContentView.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class ContentView: UIView {
    
    private let controlStacks: [Table]

    private let titleLabel: UILabel = {
        let l = AccessibleLabel()
        l.textAlignment = .center
        l.text = "Here are a few different ways to add color that responds to Increase Contrast to your app. The first one uses the default iOS color palette. The second one uses iOS \"System Colors\", and the third one uses custom colors (added through Assets). Turn on Dark Mode and/or Increase Contrast to see how each set of components reacts to each setting!"
        return l
    }()
    
    override init(frame: CGRect) {
        var stacks = [Table]()
        
        // For each theme, create a new set of controls
        Theme.allCases.forEach { stacks.append(Table(withTheme: $0)) }
        controlStacks = stacks
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        controlStacks.forEach { self.addSubview($0) }
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No implementation found for this initializer.")
    }
    
    private func addConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor,
                                        constant: 10).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                            constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                             constant:  -10).isActive = true
        
        for i in 0 ..< controlStacks.count {
            let stack = controlStacks[i]
            stack.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
            stack.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
            
            if i != 0 {
                stack.topAnchor.constraint(equalTo: controlStacks[i-1].bottomAnchor,
                                           constant: 10).isActive = true
            } else {
                stack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,
                                           constant: 10).isActive = true
            }
            
            if i == controlStacks.count - 1 {
                stack.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: -20).isActive = true
            }
        }
    }
}
