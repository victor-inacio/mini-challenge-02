import UIKit

class 
GoalComponent: StackView {
    
    let title = {
        let label = Label(text: "Meu objetivo:")
        
        return label
        
    }()
    
    let goal = {
        let label = Label(text: "Me tornar mais sociavel")
        
        return label
    }()
    
    let icon = {
        let image = Image(systemName: "pencil")
        image.tintColor = .black
        return image
    }()
    
    init() { 
        super.init(axis: .vertical, spacing: 3, alignment: .leading)
        
        backgroundColor = .red
        isAccessibilityElement = true
        accessibilityHint = "Objetivo do dia"
        layer.cornerRadius = 16
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = .init(top: 10, left: 10, bottom: 10, right: 10)
        addArrangedSubview(title)
        
        let row = StackView(axis: .horizontal, spacing: 10)
        row.addArrangedSubview(goal)
        row.addArrangedSubview(icon)
        
        addArrangedSubview(row)
        updateAcessibility()
    }
    
    func updateAcessibility() {
        accessibilityLabel = "Objetivo do dia: \(goal.text!)"
    }
    
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}

#Preview {
    GoalComponent()
}
