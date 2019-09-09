//
//  FocusTv.swift
//  focusTv
//
//  Created by eduardo.silva on 03/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

protocol FocusTvProtocol {
    func toBottomRight(view: UIView)
    func toBottomLeft(view: UIView)
    func toTopLeft(view: UIView)
    func toTopRight(view: UIView)
    func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator)
}

public final class FocusTv: FocusTvProtocol {
    
    private var originView: UIView
    private var destinyView: UIView
    private var focusGuide: UIFocusGuide
    
    public init(from origin: UIView, to destiny: UIView, focusGuide: UIFocusGuide = UIFocusGuide()) {
        self.originView = origin
        self.destinyView = destiny
        self.focusGuide = focusGuide
    }
    
    public func toBottomRight(view: UIView) {
        if (self.isOriginAxisXLesserAndAxisYLarger()) {
            self.focusGuide = QuadrantBottomRight.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        } else if (self.isOriginAxisXLargerAndAxisYLesser()) {
            self.focusGuide = QuadrantBottomRight.toUIFocusGuide(origin: self.destinyView, destiny: self.originView, view: view)
        }
    }
    
    public func toBottomLeft(view: UIView) {
        if (self.isOriginAxisXLargerAndAxisYLarger()) {
            self.focusGuide = QuadrantBottomLeft.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        } else if (self.isOriginAxisXLesserAndAxisYLesser()) {
            self.focusGuide = QuadrantBottomLeft.toUIFocusGuide(origin: self.destinyView, destiny: self.originView, view: view)
        }
    }
    
    public func toTopLeft(view: UIView) {
        if (self.isOriginAxisXLesserAndAxisYLarger()) {
            self.focusGuide = QuadrantTopLeft.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        } else if (self.isOriginAxisXLargerAndAxisYLesser()) {
            self.focusGuide = QuadrantTopLeft.toUIFocusGuide(origin: self.destinyView, destiny: self.originView, view: view)
        }
    }
    
    public func toTopRight(view: UIView) {
        if (self.isOriginAxisXLargerAndAxisYLarger()) {
            self.focusGuide = QuadrantTopRight.toUIFocusGuide(origin: self.originView, destiny: self.destinyView, view: view)
        } else if (self.isOriginAxisXLesserAndAxisYLesser()) {
            self.focusGuide = QuadrantTopRight.toUIFocusGuide(origin: self.destinyView, destiny: self.originView, view: view)
        }
    }
    
    public func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        switch nextFocusedView {
        case self.destinyView:
            self.focusGuide.preferredFocusEnvironments = [self.originView]
        case self.originView:
            self.focusGuide.preferredFocusEnvironments = [self.destinyView]
        default:
            self.focusGuide.preferredFocusEnvironments = nil
        }
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
    
    private func isOriginAxisXLesserAndAxisYLarger() -> Bool {
        return self.destinyLargerOriginAxisX() && self.destinyLesserOriginAxisY()
    }
    
    private func isOriginAxisXLargerAndAxisYLesser() -> Bool {
        return self.destinyLesserOriginAxisX() && self.destinyLargerOriginAxisY()
    }
    
    private func isOriginAxisXLargerAndAxisYLarger() -> Bool {
        return self.destinyLesserOriginAxisX() && self.destinyLesserOriginAxisY()
    }
    
    private func isOriginAxisXLesserAndAxisYLesser() -> Bool {
        return self.destinyLargerOriginAxisX() && self.destinyLargerOriginAxisY()
    }
    
}
