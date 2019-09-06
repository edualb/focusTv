//
//  QuadrantTopRight.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

final class QuadrantTopRight: QuadrantProtocol {
    
    static func toUIFocusGuide(origin: UIView, destiny: UIView, view: UIView) -> UIFocusGuide {
        let focus = UIFocusGuide()
        view.addLayoutGuide(focus)
        
        focus.configTopQuadrantWithoutSideAnchor(origin: origin, destiny: destiny)
        focus.leftAnchor
            .constraint(equalTo: origin.leftAnchor)
            .isActive = true
        return focus
    }
    
}
