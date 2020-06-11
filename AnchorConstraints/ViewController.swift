//
//  ViewController.swift
//  AnchorConstraints
//
//  Created by Hari Haran on 11/06/20.
//  Copyright © 2020 Hari Haran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum AnchorType:String {
        case Basic,Fill,Center,Equal
    }
    
    let displayLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(displayLabel)
        addAnchor(withType: .Center)
    }
    
    
}


extension ViewController {
    
    /// An function which includes all options of the Anchor created
    /// - Parameter withType: enum of available anchor types
    func addAnchor(withType: AnchorType){
        
        displayLabel.text = withType.rawValue
        
        switch withType {
        case .Basic:
            displayLabel.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 80, left: 50, bottom: 0, right: 50), size: CGSize(width: 0, height: 50))
        case .Fill:
            displayLabel.fillSuperview(padding: UIEdgeInsets(top: 50, left: 50, bottom: 50, right: 50))
        case .Center:
            displayLabel.centerInSuperview(size: CGSize(width: 100, height: 100))
        default:
            break
        }
    }
    
}
