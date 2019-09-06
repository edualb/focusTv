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
        
        focus.widthAnchor
            .constraint(equalTo: destiny.widthAnchor)
            .isActive = true
        focus.heightAnchor
            .constraint(equalTo: origin.heightAnchor)
            .isActive = true
        focus.topAnchor
            .constraint(equalTo: origin.topAnchor)
            .isActive = true
        focus.leftAnchor
            .constraint(equalTo: destiny.leftAnchor)
            .isActive = true
        return focus
    }
    
}
