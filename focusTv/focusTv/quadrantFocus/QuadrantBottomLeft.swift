//
//  QuadrantBottomLeft.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

final class QuadrantBottomLeft: QuadrantProtocol {
    
    static func toUIFocusGuide(origin: UIView, destiny: UIView, view: UIView) -> UIFocusGuide {
        let focus = UIFocusGuide()
        view.addLayoutGuide(focus)
        
        focus.configBottomQuadrantWithoutSideAnchor(origin: origin, destiny: destiny)
        focus.rightAnchor
            .constraint(equalTo: destiny.rightAnchor)
            .isActive = true
        return focus
    }
    
}
