//
//  extension.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

extension UIFocusGuide {
    func configBottomQuadrantWithoutSideAnchor(origin: UIView, destiny: UIView) {
        self.widthAnchor
            .constraint(equalTo: destiny.widthAnchor)
            .isActive = true
        self.heightAnchor
            .constraint(equalTo: origin.heightAnchor)
            .isActive = true
        self.topAnchor
            .constraint(equalTo: origin.topAnchor)
            .isActive = true
    }
    
    func configTopQuadrantWithoutSideAnchor(origin: UIView, destiny: UIView) {
        self.widthAnchor
            .constraint(equalTo: origin.widthAnchor)
            .isActive = true
        self.heightAnchor
            .constraint(equalTo: destiny.heightAnchor)
            .isActive = true
        self.topAnchor
            .constraint(equalTo: destiny.topAnchor)
            .isActive = true
    }
}
