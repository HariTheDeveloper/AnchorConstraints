//
//  Anchors.swift
//  AnchorConstraints
//
//  Created by Hari Haran on 11/06/20.
//  Copyright © 2020 Hari Haran. All rights reserved.
//

import Foundation
import UIKit

/// Struct to specify the layout margins of a UIView
struct AnchorConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}

/// Enum used to add the parameters in creating a equal width or height of a view
enum anchorEntity {
    case width
    case height
    case both
}

extension UIView {
    
    /// Below function is used to add basic constraints in setting up a view
    /// - Parameters:
    ///   - top: space of the view from top to the superView
    ///   - leading: space of the view from leading to the superView
    ///   - bottom: space of the view from bottom to the superView
    ///   - trailing: space of the view from trailing to the superView
    ///   - padding: space of the view from all sides to the superView
    ///   - size: width and height for the views
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchorConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchorConstraints = AnchorConstraints()
        
        if let top = top {
            anchorConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchorConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let bottom = bottom {
            anchorConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let trailing = trailing {
            anchorConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchorConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchorConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [anchorConstraints.top, anchorConstraints.leading, anchorConstraints.bottom, anchorConstraints.trailing, anchorConstraints.width, anchorConstraints.height].forEach{ $0?.isActive = true }
        
        return anchorConstraints
    }
    
    
    /// Function to fill the view to its Superview with padding
    /// - Parameter padding: Specify constants from the margin
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    
    /// Function to center the view to its Superview with size
    /// - Parameter size: width and height
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    /// To create equal widths / heights or both of view to its superView
    /// - Parameters:
    ///   - toview: The superview which is used for the equal widths/ heights
    ///   - entity: An enum to specify the type (width/height/both)
    func equalWidthsORHeights(toview: UIView, entity:anchorEntity) {
        translatesAutoresizingMaskIntoConstraints = false
        switch entity {
        case .both:
            if let superviewWidthAnchor = superview?.widthAnchor, let superviewHeightAnchor = superview?.heightAnchor{
                widthAnchor.constraint(equalTo: superviewWidthAnchor).isActive = true
                heightAnchor.constraint(equalTo: superviewHeightAnchor).isActive = true
            }
        case .width:
            if let superviewWidthAnchor = superview?.widthAnchor {
                widthAnchor.constraint(equalTo: superviewWidthAnchor).isActive = true
            }
        case .height:
            if let superviewHeightAnchor = superview?.heightAnchor {
                heightAnchor.constraint(equalTo: superviewHeightAnchor).isActive = true
            }
        }
    }
}
