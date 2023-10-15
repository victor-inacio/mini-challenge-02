import UIKit

protocol SwipableCellDelegate: AnyObject {
    func onCollectionViewCellDeleted(_ collection: SwipableCollectionViewCell)
}

class SwipableCollectionViewCell: UICollectionViewCell {
    
    
    
    private var dragGesture: UIPanGestureRecognizer!
    private var initialCenter: CGPoint!
    private var percent: Float = 0
    weak var delegate: SwipableCellDelegate?
    
    internal func swipeInit() {
        
        self.initialCenter = self.center
        self.isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(onSwipe))
        
        self.dragGesture = gesture
        
        self.addGestureRecognizer(self.dragGesture)
        
    }
    
    @objc private func onSwipe(_ gesture: UIPanGestureRecognizer) {
        let state = gesture.state
        let translation = gesture.translation(in: self)
        
        
        switch(state) {
            case .began:
                print("Começou")
                
                
            case .ended:
                if (percent <= 0.3) {
                    deleteCell()
                } else {
                    resetCell()
                }
                
            case .possible:
                print("Possible")
            case .changed:
                let newCenter: CGPoint = .init(x: initialCenter.x + translation.x, y: center.y)
                
                self.center = newCenter
                
                percent = Float(center.x / initialCenter.x)
                layer.opacity = percent
                
            case .cancelled:
                print("Cancelled")
            case .failed:
                print("Failed")
            @unknown default:
                print("Default")
                
                
        } 
    }
    
    private func deleteCell() {
        
        UIView.animate(withDuration: 0.2) {
            self.center.x = -100
            self.layer.opacity = 0
            self.layoutSubviews()
        } completion: { isCompleted in
            if isCompleted {
                self.delegate?.onCollectionViewCellDeleted(self)
            }
        }
    }
    
    private func resetCell() {
        UIView.animate(withDuration: 0.2) {
            self.center.x = self.initialCenter.x
            self.layer.opacity = 1
            self.layoutSubviews()
        } completion: { isCompleted in
        }
    }
    
}
