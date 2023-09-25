import UIKit

class TextView: UITextView, UITextViewDelegate {
    
    var placeholderOn = true
    var placeholder: String!
    
    init(placeholder: String) {
        super.init(frame: .init(x: 0, y: 0, width: 100, height: 100), textContainer: nil)
        
        translatesAutoresizingMaskIntoConstraints = false
        
        self.placeholder = placeholder
        layer.cornerRadius = 28
        textContainerInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        backgroundColor = .white
        placePlaceholder()
        delegate = self
    }
    
    func placePlaceholder() {
        placeholderOn = true
        text = placeholder
    }
    
    func removePlaceholder() {
        placeholderOn = false
        text = ""
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (placeholderOn) {
            removePlaceholder()
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if (text == "") {
            placePlaceholder()
        }
    }
    
    
    
}

#Preview {
    TextView(placeholder: "ASD")
}
