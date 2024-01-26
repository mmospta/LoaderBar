//
//  LoaderBarView.swift
//  LoaderBar
//
//  Created by MM on 25/1/2567 BE.
//

import UIKit

class LoaderBarView: UIView {
    let barLayer = CALayer()
    
    var multiplyBarWidthPercent: CGFloat = 0.5
    var duration: CGFloat = 1.4
    var barColor: UIColor = .black
    var bgColor: UIColor = .brown
    
    init(frame: CGRect,
         multiplyBarWidthPercent: CGFloat = 0.5,
         duration: CFTimeInterval = 1.4,
         barColor: UIColor = .black,
         bgColor: UIColor = .brown) {
        super.init(frame: CGRect(origin: .zero, size: frame.size))
        self.multiplyBarWidthPercent = multiplyBarWidthPercent
        self.duration = duration
        self.barColor = barColor
        self.bgColor = bgColor
        setupView()
        animationLayer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
        animationLayer()
    }
    
    func setupView() {
        backgroundColor = bgColor
        layer.cornerRadius = bounds.height / 2
        layer()
    }
    
    func layer() {
        let barWidth = bounds.width * multiplyBarWidthPercent
        let offsetPosition = barWidth / 2
        barLayer.bounds = CGRect(origin: .zero, size: CGSize(width: bounds.width * multiplyBarWidthPercent, height: bounds.height))
        barLayer.position = CGPoint(x: -offsetPosition, y: bounds.midY)
        barLayer.backgroundColor = barColor.cgColor
        barLayer.cornerRadius = bounds.height / 2
        layer.addSublayer(barLayer)
        clipsToBounds = true
    }
    
    func animationLayer() {
        let barWidth = bounds.width * multiplyBarWidthPercent
        let offsetPosition = barWidth / 2
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = barLayer.position
        animation.toValue = CGPoint(x: bounds.maxX + offsetPosition, y: bounds.midY)
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = .infinity
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        barLayer.add(animation, forKey: "positionAnimation")
    }
}
