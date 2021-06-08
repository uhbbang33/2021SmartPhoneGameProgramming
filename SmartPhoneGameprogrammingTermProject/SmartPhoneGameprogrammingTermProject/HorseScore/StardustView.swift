//
//  StardustView.swift
//  Anagrams
//
//  Created by kpugame on 2021/04/27.
//  Copyright © 2021 Caroline. All rights reserved.
//

import Foundation
import UIKit

class StardustView: UIView
{
    private var emitter: CAEmitterLayer!
    
    override class var layerClass: AnyClass
    {
        return CAEmitterLayer.self
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        emitter = self.layer as! CAEmitterLayer
        emitter.emitterPosition = CGPoint(x: self.bounds.size.width / 2, y: self.bounds.size.height / 2)
        emitter.emitterSize = self.bounds.size
        emitter.renderMode = CAEmitterLayerRenderMode.additive
        emitter.emitterShape = CAEmitterLayerEmitterShape.rectangle
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        if self.superview == nil
        {
            return
        }
        
        let texture: UIImage? = UIImage(named: "horse2particle")
        
        assert(texture != nil, "particle image not found")
        
        let emitterCell = CAEmitterCell()
        
        emitterCell.name = "cell"
        emitterCell.contents = texture?.cgImage
        emitterCell.birthRate = 200
        emitterCell.lifetime = 10
        emitterCell.greenRange = 0.98
        emitterCell.blueSpeed = -0.99
        emitterCell.xAcceleration = -150
        emitterCell.yAcceleration = 100
        emitterCell.velocity = 100
        emitterCell.velocityRange = 40
        emitterCell.scaleRange = 0.8
        emitterCell.scaleSpeed = -0.2
        emitterCell.emissionRange = CGFloat(Double.pi * 2)
        emitter.emitterCells = [emitterCell]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {self.removeFromSuperview()})
        }
    }

