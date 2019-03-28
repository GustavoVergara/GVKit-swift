//
//  UIViewExtensions.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 05/11/18.
//

import UIKit
//import SnapKit

public extension Utils where Base: UIView {
    
//    static func separator(ofSize size: CGSize = CGSize(width: 1, height: CGFloat.nan), color: UIColor = UIColor.lightGray) -> UIView {
//        let separatorView = UIView()
//        separatorView.backgroundColor = color
//        separatorView.snp.makeConstraints { (make) in
//            if size.width.isFinite {
//                make.width.equalTo(size.width)
//            }
//            if size.height.isFinite {
//                make.height.equalTo(size.height)
//            }
//        }
//        return separatorView
//    }

    func applyShadow(
        color: CGColor = UIColor.black.cgColor,
        offset: CGSize = .zero,
        radius: CGFloat = 4,
        opacity: Float = 0.3,
        shouldRasterize: Bool = true
    ) {
        self.base.layer.shadowColor = color
        self.base.layer.shadowOffset = offset
        self.base.layer.shadowOpacity = opacity
        self.base.layer.shadowRadius = radius
        
        self.base.layer.shouldRasterize = shouldRasterize
        if shouldRasterize {
            self.base.layer.rasterizationScale = UIScreen.main.scale
        }

        if self.base.layer.cornerRadius > 0 {
            self.base.layer.shadowPath = UIBezierPath(roundedRect: self.base.bounds, cornerRadius: self.base.layer.cornerRadius).cgPath
        } else {
            self.base.layer.shadowPath = UIBezierPath(rect: self.base.bounds).cgPath
        }
    }
    
}
