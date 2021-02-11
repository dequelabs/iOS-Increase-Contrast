//
//  Theme.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

enum Theme: CaseIterable {
    
    case defaultTheme
    case systemTheme
    case customTheme
    
    var title: String {
        switch self {
        case .defaultTheme: return "Default Colors"
        case .systemTheme: return "Non-default System Colors"
        case .customTheme: return "Custom Colors"
        }
    }
    
    var textColor: UIColor? {
        switch self {
        case .defaultTheme: return nil
        case .systemTheme: return .label
        case .customTheme: return UIColor(named: "Text")
        }
    }
    
    var tintColor: UIColor? {
        switch self {
        case .defaultTheme: return .systemBlue
        case .systemTheme: return .systemIndigo
        case .customTheme: return UIColor(named: "Tint")
        }
    }
    
    var switchOnTintColor: UIColor? {
        switch self {
        case .defaultTheme: return nil
        case .systemTheme: return .systemOrange
        case .customTheme: return UIColor(named: "Switch Tint")
        }
    }
    
    var buttonName: String {
        switch self {
        case .defaultTheme: return "Default"
        case .systemTheme: return "System"
        case .customTheme: return "Custom"
        }
    }
    
    var backgroundColor: UIColor? {
        switch self {
        case .defaultTheme: return nil
        case .systemTheme: return .systemGray6
        case .customTheme: return UIColor(named: "Background")
        }
    }
}
