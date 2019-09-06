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
    
    private var focusGuide: UIFocusGuide? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(originButton)
        self.view.addSubview(destinyButton)
        self.focusGuide = FocusTv(origin: originButton, destiny: destinyButton).toUIFocusGuide(view: self.view)
        originButton.backgroundColor = .red
        destinyButton.backgroundColor = .green
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        
        guard let nextFocusedView = context.nextFocusedView else { return }
        
        switch nextFocusedView {
        case self.destinyButton:
            self.focusGuide?.preferredFocusEnvironments = [self.originButton]
        case self.originButton:
            self.focusGuide?.preferredFocusEnvironments = [self.destinyButton]
        default:
            self.focusGuide?.preferredFocusEnvironments = nil
        }
    }


}

