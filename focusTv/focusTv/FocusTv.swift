//
//  FocusTv.swift
//  focusTv
//
//  Created by eduardo.silva on 03/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

protocol FocusTvProtocol {
    func toUIFocusGuide() -> UIFocusGuide
}

class FocusTv: FocusTvProtocol {
    
    private var originView: UIView
    private var destinyView: UIView
    
    init(origin: UIView, destiny: UIView) {
        self.originView = origin
        self.destinyView = destiny
    }
    
    func toUIFocusGuide() -> UIFocusGuide {
        if (self.destinyLargerOriginAxisX() && self.destinyLargerOriginAxisY()) {
            print("destinyLargerOriginAxisX && destinyLargerOriginAxisY")
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
    
}
