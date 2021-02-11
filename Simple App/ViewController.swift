//
//  ViewController.swift
//  Simple App
//
//  Created by Jennifer Dailey on 2/10/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        let scrollView = UIScrollView()
        let contentView = ContentView()
        
        self.view.backgroundColor = .systemBackground
        
        scrollView.addSubview(contentView)
        self.view.addSubview(scrollView)
        
        scrollView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
    }
}
