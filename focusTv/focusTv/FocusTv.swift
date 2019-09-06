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
        let focus = UIFocusGuide()
        view.addLayoutGuide(focus)
        if (self.destinyLargerOriginAxisX() && self.destinyLessOriginAxisY()) {
            focus.widthAnchor
                .constraint(equalTo: self.destinyView.widthAnchor)
                .isActive = true
            focus.heightAnchor
                .constraint(equalTo: self.originView.heightAnchor)
                .isActive = true
            focus.topAnchor
                .constraint(equalTo: self.originView.topAnchor)
                .isActive = true
            focus.leftAnchor
                .constraint(equalTo: self.destinyView.leftAnchor)
                .isActive = true
            return focus
        }
        return focus
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
    
    private func destinyLessOriginAxisY() -> Bool {
        return self.getDestinyAxisY() < self.getOriginAxisY()
    }
    
    private func destinyLessOriginAxisX() -> Bool {
        return self.getDestinyAxisX() < self.getOriginAxisX()
    }
    
}
