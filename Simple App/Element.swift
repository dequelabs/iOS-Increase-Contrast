//
//  Element.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

enum Element: String, CaseIterable {
    
    case button = "Button"
    case uiswitch = "Switch"
    case slider = "Slider"

    func create(withTheme theme: Theme) -> UIView {
        
        switch self {
        case .button:
            let button = UIButton()
            button.setTitle(theme.buttonName, for: .normal)
            button.setTitleColor(theme.tintColor, for: .normal)
            return button
            
        case .uiswitch:
            let uiswitch = UISwitch()
            uiswitch.tintColor = theme.switchOnTintColor
            uiswitch.onTintColor = theme.switchOnTintColor
            uiswitch.isOn = true
            return uiswitch
            
        case .slider:
            let slider = UISlider()
            slider.tintColor = theme.tintColor
            slider.value = 0.5
            return slider
        }
    }
}
