//
//  UIView.swift
//  NewProject
//
//  Created by Yarramsetti Yedukondalu on 06/08/25.
//

import Foundation
import UIKit

extension UIView {
    func applyCornerRadiusAndShadow(
        cornerRadius: CGFloat = 5,
        shadowColor: UIColor = .black,
        shadowOpacity: Float = 0.2,
        shadowOffset: CGSize = CGSize(width: 0, height: 2),
        shadowRadius: CGFloat = 4
    ) {
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = false
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
    }
}
