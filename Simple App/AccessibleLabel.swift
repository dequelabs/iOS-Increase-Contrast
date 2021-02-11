//
//  AccessibleLabel.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class AccessibleLabel: UILabel {
    
    init(withTextStyle textStyle: UIFont.TextStyle = .body) {
        super.init(frame: .zero)
        setup()
        self.font = UIFont.preferredFont(forTextStyle: textStyle)
        
        if textStyle == .headline {
            self.accessibilityTraits = [self.accessibilityTraits, .header]
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.adjustsFontForContentSizeCategory = true
        self.numberOfLines = 0
    }
}
