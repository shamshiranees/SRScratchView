//
//  ViewController.swift
//  SRScratchView
//
//  Created by Shamshir.anees@gmail.com on 01/04/2018.
//  Copyright (c) 2018 Shamshir.anees@gmail.com. All rights reserved.
//

import UIKit
import SRScratchView

class ViewController: UIViewController,SRScratchViewDelegate{
    
    
    
    @IBOutlet weak var bgView: UIView!
    
    func scratchCardEraseProgress(eraseProgress: Float) {
        print(eraseProgress)
        if eraseProgress > 60.0{
            UIView.animate(withDuration: 0.5, animations: {
                self.scratchImageView.alpha = 0.0
                self.bgView.isHidden = false
            })
            
        }
    }
    
    
    
    @IBOutlet weak var scratchImageView: SRScratchView!
    
    
    @IBOutlet weak var scratchCardView: UIView!
    
    @IBOutlet weak var trophyBgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.bgView.isHidden = true
        scratchImageView.lineWidth = 40.0
        self.scratchImageView.delegate = self
        
        self.scratchImageView.layer.cornerRadius = 8
        self.scratchImageView.layer.masksToBounds = true
        
        self.scratchCardView.layer.cornerRadius = 8
        self.scratchCardView.layer.masksToBounds = true
        
        self.trophyBgView.layer.cornerRadius = self.trophyBgView.frame.height/2
        self.trophyBgView.layer.masksToBounds = true
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
}

