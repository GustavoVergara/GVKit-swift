//
//  GradientView.swift
//  CCFMAddons
//
//  Created by Gustavo Vergara Garcia on 31/10/18.
//

import UIKit

@IBDesignable
public class GradientView: UIView {
    
    private var gradientLayer: CAGradientLayer!
    
    @IBInspectable
    public var topColor: UIColor = .clear {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var bottomColor: UIColor = .clear {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var shadowColor: UIColor = .clear {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var shadowX: CGFloat = 0 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var shadowY: CGFloat = -3 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var shadowBlur: CGFloat = 3 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var startPointX: CGFloat = 0.5 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var startPointY: CGFloat = 0 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var endPointX: CGFloat = 0.5 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var endPointY: CGFloat = 1 {
        didSet { self.setNeedsLayout() }
    }
    
    @IBInspectable
    public var cornerRadius: CGFloat = 0 {
        didSet { self.setNeedsLayout() }
    }
    
    public override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    public override func layoutSubviews() {
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [self.topColor.cgColor, self.bottomColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        self.layer.shadowRadius = shadowBlur
        self.layer.shadowOpacity = 1
        
    }
    
    public func animate(duration: TimeInterval, newTopColor: UIColor, newBottomColor: UIColor) {
        let fromColors = self.gradientLayer?.colors
        let toColors = [newTopColor.cgColor, newBottomColor.cgColor]
        self.gradientLayer?.colors = toColors
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = fromColors
        animation.toValue = toColors
        animation.duration = duration
        animation.isRemovedOnCompletion = true
        animation.fillMode = .forwards
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        self.gradientLayer?.add(animation, forKey: "animateGradient")
    }
}
