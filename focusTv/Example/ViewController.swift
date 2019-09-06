//
//  ViewController.swift
//  Example
//
//  Created by eduardo.silva on 04/09/19.
//  Copyright © 2019 eduardo.silva. All rights reserved.
//

import UIKit
import FocusTv

class ViewController: UIViewController {

    @IBOutlet weak var destinyButton: UIButton!
    @IBOutlet weak var originButton: UIButton!
    
    private var focusGuideBottomRight: UIFocusGuide? = nil;
    private var focusGuideTopLeft: UIFocusGuide? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.focusGuideBottomRight = FocusTv(origin: destinyButton, destiny: originButton).toBottomRightUIFocusGuide(view: self.view)
        self.focusGuideTopLeft = FocusTv(origin: destinyButton, destiny: originButton).toTopLeftUIFocusGuide(view: self.view)
        originButton.backgroundColor = .red
        destinyButton.backgroundColor = .green
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        switch nextFocusedView {
        case self.destinyButton:
            self.focusGuideBottomRight?.preferredFocusEnvironments = [self.originButton]
            self.focusGuideTopLeft?.preferredFocusEnvironments = [self.originButton]
        case self.originButton:
            self.focusGuideBottomRight?.preferredFocusEnvironments = [self.destinyButton]
            self.focusGuideTopLeft?.preferredFocusEnvironments = [self.destinyButton]
        default:
            self.focusGuideBottomRight?.preferredFocusEnvironments = nil
            self.focusGuideTopLeft?.preferredFocusEnvironments = nil
        }
    }


}

