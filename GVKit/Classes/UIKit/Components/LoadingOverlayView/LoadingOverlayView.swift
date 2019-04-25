//
//  LoadingOverlayView.swift
//  CCFMAddonsSource
//
//  Created by Gustavo Vergara Garcia on 08/11/18.
//  Copyright © 2018 Fulllab. All rights reserved.
//

import UIKit

public class LoadingOverlayView: UIView {
    
    public let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    public let blurView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    public init() {
        super.init(frame: .zero)
        
        self.prepareViews()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.prepareViews()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.blurView.frame = self.bounds
        self.activityIndicator.center = self.center
    }
    
    public override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        if let superview = self.superview {
            self.frame = superview.bounds
        }
    }
    
    public func prepareViews() {
        self.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.backgroundColor = .clear
        
        self.activityIndicator.hidesWhenStopped = true
        self.activityIndicator.startAnimating()
        
        self.addSubview(self.blurView)
        self.addSubview(self.activityIndicator)
    }
    
}

public extension Utils where Base: UIView {
    
    var hasLoadingOverlay: Bool {
        return self.base.subviews.contains(where: { $0 is LoadingOverlayView })
    }
    
    func addLoadingOverlay() {
        guard self.hasLoadingOverlay == false else { return }
        let loadingView = LoadingOverlayView()
        self.base.addSubview(loadingView)
    }
    
    func removeLoadingOverlay() {
        self.base.subviews.forEach({ ($0 as? LoadingOverlayView)?.removeFromSuperview() })
    }
    
}
