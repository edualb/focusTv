//
//  FocusTv.swift
//  focusTv
//
//  Created by eduardo.silva on 03/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

protocol FocusTvProtocol {
    func toUIFocusGuide(view: UIView) -> UIFocusGuide
}

public class FocusTv: FocusTvProtocol {
    
    private var originView: UIView
    private var destinyView: UIView
    
    public init(origin: UIView, destiny: UIView) {
        self.originView = origin
        self.destinyView = destiny
    }
    
    public func toUIFocusGuide(view: UIView) -> UIFocusGuide {
        if (self.destinyLargerOriginAxisX() && self.destinyLesserOriginAxisY()) {
            return QuadrantBottomRight.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        } else if (self.destinyLesserOriginAxisX() && self.destinyLesserOriginAxisY()) {
            return QuadrantBottomLeft.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        }
        return UIFocusGuide()
    }
    
    private func getOriginAxisX() -> Float {
        return Float(self.originView.frame.origin.x)
    }
    
    private func getOriginAxisY() -> Float {
        return Float(self.originView.frame.origin.y)
    }
    
    private func getDestinyAxisX() -> Float {
        return Float(self.destinyView.frame.origin.x)
    }
    
    private func getDestinyAxisY() -> Float {
        return Float(self.destinyView.frame.origin.y)
    }
    
    private func destinyLargerOriginAxisX() -> Bool {
        return self.getDestinyAxisX() > self.getOriginAxisX()
    }
    
    private func destinyLargerOriginAxisY() -> Bool {
        return self.getDestinyAxisY() > self.getOriginAxisY()
    }
    
    private func destinyLesserOriginAxisY() -> Bool {
        return self.getDestinyAxisY() < self.getOriginAxisY()
    }
    
    private func destinyLesserOriginAxisX() -> Bool {
        return self.getDestinyAxisX() < self.getOriginAxisX()
    }
    
}
