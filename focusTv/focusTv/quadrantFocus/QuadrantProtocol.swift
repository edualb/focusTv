//
//  quadrantProtocol.swift
//  FocusTv
//
//  Created by eduardo.silva on 06/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import Foundation

protocol QuadrantProtocol {
    func toUIFocusGuide(origin: UIView, destiny: UIView, view: UIView) -> UIFocusGuide
}
