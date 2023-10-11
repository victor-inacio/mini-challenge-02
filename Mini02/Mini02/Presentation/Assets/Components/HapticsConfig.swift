//
//  HapticsConfig.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 10/10/23.
//
import UIKit

class HapticManager {
    static let shared = HapticManager()
    
    private var feedbackGenerator: UIImpactFeedbackGenerator?
    
    private init() {
        feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
        feedbackGenerator?.prepare()
    }
    
    func generateHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        feedbackGenerator = UIImpactFeedbackGenerator(style: style)
        feedbackGenerator?.prepare()
        feedbackGenerator?.impactOccurred()
    }
}
