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
    
    private var originView: UIView?
    private var destinyView: UIView?
    
    init(origin: UIView, destiny: UIView) {
        self.originView = origin
        self.destinyView = destiny
    }
    
    func toUIFocusGuide() -> UIFocusGuide {
        return UIFocusGuide()
    }
    
}
