//
//  RoundedButton.swift
//  LiveShows
//
//  Created by Gustavo Vergara Garcia on 29/10/18.
//  Copyright © 2018 Fulllab. All rights reserved.
//

import UIKit

//@IBDesignable
open class RoundedButton: UIButton {
    
    // MARK: - Properties
    // MARK: Overrides
    
    open override var isSelected: Bool {
        didSet {
            self.didUpdateControlState()
        }
    }
    
    open override var isEnabled: Bool {
        didSet {
            self.didUpdateControlState()
        }
    }
    
    open override var isHighlighted: Bool {
        didSet {
            self.didUpdateControlState()
        }
    }

    // MARK: Public
    @IBInspectable
    open var borderColor: UIColor? {
        get {
            return self.layer.borderColor?.uiColor
        }
        set {
            self.setBorderColor(newValue, for: .normal)
        }
    }
    
    @IBInspectable
    open var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.setBorderWidth(newValue, for: .normal)
        }
    }
    
    // MARK: Private
    
    private var borderWidthForControlState = [UInt : CGFloat]()
    private var borderColorForControlState = [UInt : CGColor]()
    private var fontForControlState = [UInt : UIFont]()
    
    // MARK: - Constructors
    
    public override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.prepare()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.prepare()
    }
    
    // MARK: - UIView Overrides
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if rect.height > rect.width {
            self.layer.cornerRadius = rect.width / 2
        } else {
            self.layer.cornerRadius = rect.height / 2
        }
    }
    
    // MARK: Public Methods
    
    open func setBorderWidth(_ borderWidth: CGFloat, for controlState: UIControl.State) {
        self.borderWidthForControlState[controlState.rawValue] = borderWidth
        self.didUpdateControlState()
    }
    
    open func setBorderColor(_ borderColor: UIColor?, for controlState: UIControl.State) {
        self.borderColorForControlState[controlState.rawValue] = borderColor?.cgColor
        self.didUpdateControlState()
    }
    
    open func setFont(_ font: UIFont, for controlState: UIControl.State) {
        self.fontForControlState[controlState.rawValue] = font
        self.didUpdateControlState()
    }
    
    open func prepare() {
        self.setBorderColor(self.borderColor, for: .normal)
        self.setBorderWidth(self.borderWidth, for: .normal)
    }

    // MARK: Private Methods
    
    private func didUpdateControlState() {
        self.updateBorderWidth()
        self.updateFont()
        self.updateBorderColor()
    }
    
    private func updateBorderWidth() {
        self.layer.borderWidth = self.borderWidthForControlState[self.state.rawValue]
                              ?? self.borderWidthForControlState[UIControl.State.normal.rawValue]
                              ?? 0
    }
    
    private func updateBorderColor() {
        self.layer.borderColor = self.borderColorForControlState[self.state.rawValue]
                              ?? self.borderColorForControlState[UIControl.State.normal.rawValue]
    }
    
    private func updateFont() {
        guard let font = self.fontForControlState[self.state.rawValue] ?? self.fontForControlState[UIControl.State.normal.rawValue] else {
            return
        }
        self.titleLabel?.font = font
    }
    
    
}

extension CGColor {
    
    var uiColor: UIColor {
        return UIColor(cgColor: self)
    }
    
}
