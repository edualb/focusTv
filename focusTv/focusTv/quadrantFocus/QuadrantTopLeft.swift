//
//  QuadrantTopLeft.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

final class QuadrantTopLeft: QuadrantProtocol {
    
    static func toUIFocusGuide(origin: UIView, destiny: UIView, view: UIView) -> UIFocusGuide {
        let focus = UIFocusGuide()
        view.addLayoutGuide(focus)
        
        focus.configTopQuadrantWithoutSideAnchor(origin: origin, destiny: destiny)
        focus.trailingAnchor
            .constraint(equalTo: origin.trailingAnchor)
            .isActive = true
        return focus
    }
    
}
