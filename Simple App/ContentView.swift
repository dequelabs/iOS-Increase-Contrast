//
//  ContentView.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class ContentView: UIView {
    
    private let controlStacks: [Table]

    override init(frame: CGRect) {
        var stacks = [Table]()
        
        // For each theme, create a new set of controls
        Theme.allCases.forEach { stacks.append(Table(withTheme: $0)) }
        controlStacks = stacks
        super.init(frame: frame)
        
        controlStacks.forEach { self.addSubview($0) }
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("No implementation found for this initializer.")
    }
    
    private func addConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false

        for i in 0 ..< controlStacks.count {
            let stack = controlStacks[i]
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                           constant: 10).isActive = true
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor,
                                            constant: -10).isActive = true
            
            if i != 0 {
                stack.topAnchor.constraint(equalTo: controlStacks[i-1].bottomAnchor,
                                           constant: 10).isActive = true
            } else {
                stack.topAnchor.constraint(equalTo: self.topAnchor,
                                           constant: 10).isActive = true
            }
            
            if i == controlStacks.count - 1 {
                stack.bottomAnchor.constraint(equalTo: self.bottomAnchor,
                                              constant: -20).isActive = true
            }
        }
    }
}
