//
//  DayCircle.swift
//  Mini02
//
//  Created by Thiago Pereira de Menezes on 24/09/23.
//

import UIKit

class DayCircle: UIView {
    
    let circleSize: CGFloat = 40.0 // Tamanho desejado do círculo.
    
    override init(frame: CGRect) {
        let adjustedFrame = CGRect(x: frame.origin.x, y: frame.origin.y, width: circleSize, height: circleSize)
        super.init(frame: adjustedFrame)
        backgroundColor = UIColor(red: 0.23, green: 0.58, blue: 0.76, alpha: 1.0)
        layer.cornerRadius = circleSize / 2.0
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }

}
