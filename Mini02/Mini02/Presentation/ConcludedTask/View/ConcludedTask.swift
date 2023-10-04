import UIKit

class ConcludedTask: UIViewController, DiscomfortSelectorDelegate {
    
    let titleLabel = {
       let label = Label(text: "Tarefa concluída")
        
        return label
    }()
    
    let icon = {
        let image = Image(systemName: "square.and.pencil")
            
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 160),
            image.heightAnchor.constraint(equalToConstant: 160)
        ])
        
        return image
    }()
    
    let feelingLabel = {
        let label = Label(text: "Como você se sentiu fazendo essa tarefa?")
        
        return label
    }()
    
    let button = {
        let button = Button(title: "Salvar")
        return button
    }()
    
    let stack = {
        let stack = StackView(axis: .vertical, spacing: 10, alignment: .center)
        return stack
    }()
    
    let discomfortSelector = {
        let discomfortSelector = DiscomfortSelector()
        return discomfortSelector
    }()

    
    override func viewDidLoad() {
        
        discomfortSelector.delegate = self
        
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(icon)
        stack.addArrangedSubview(feelingLabel)
        stack.addArrangedSubview(discomfortSelector)
        stack.addArrangedSubview(button)
        
        
        button.addTarget(self, action: #selector(onSubmit), for: .touchUpInside)
        view.addSubview(stack)
    }
    
    @objc func onSubmit() {
        print("Saved!")
    }
    
    func onDiscomfortValueChange(discomfort: DiscomfortLevel) {
        
    }
    
}

#Preview {
    ConcludedTask()
}
