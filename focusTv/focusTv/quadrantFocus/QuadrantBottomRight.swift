//
//  quadrantBottomRight.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

final class QuadrantBottomRight: QuadrantProtocol {
    
    static func toUIFocusGuide(origin: UIView, destiny: UIView, view: UIView) -> UIFocusGuide {
        let focus = UIFocusGuide()
        view.addLayoutGuide(focus)
        
        focus.configBottomQuadrantWithoutSideAnchor(origin: origin, destiny: destiny)
        focus.leftAnchor
            .constraint(equalTo: destiny.leftAnchor)
            .isActive = true
        return focus
    }
    
}
