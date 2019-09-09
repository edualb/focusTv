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
    
    private var focusGuideBottomRight: FocusTv? = nil;
    private var focusGuideTopLeft: FocusTv? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.focusGuideBottomRight = FocusTv(from: destinyButton, to: originButton)
        self.focusGuideBottomRight?.toBottomRight(view: self.view)
        
        self.focusGuideTopLeft = FocusTv(from: destinyButton, to: originButton)
        self.focusGuideTopLeft?.toTopLeft(view: self.view)
        
        originButton.backgroundColor = .red
        destinyButton.backgroundColor = .green
    }
    
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        super.didUpdateFocus(in: context, with: coordinator)
        self.focusGuideTopLeft?.didUpdateFocus(in: context, with: coordinator)
        self.focusGuideBottomRight?.didUpdateFocus(in: context, with: coordinator)
    }


}

