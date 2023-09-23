import UIKit

class CreateTaskViewController: UIViewController {
    let textInput = TextView(placeholder: "Descreva essa tarefa")
    override func viewDidLoad() {
        
        view.backgroundColor = .lightGray
        let stack = StackView(axis: .vertical, spacing: 20)
        
        stack.addArrangedSubview(Label(text: "Criar nova tarefa"))
        stack.addArrangedSubview(Label(text: "Nome da Tarefa"))
        
        let buttonsStack = StackView(axis: .horizontal, spacing: 20)
        buttonsStack.addArrangedSubview(Button(title: "Fácil"))
        buttonsStack.addArrangedSubview(Button(title: "Médio"))
        buttonsStack.addArrangedSubview(Button(title: "Difícil"))
        
        stack.addArrangedSubview(buttonsStack)
        stack.addArrangedSubview(textInput)
        stack.addArrangedSubview(Button(title: "Salvar"))
        view.addSubview(stack)
        
        NSLayoutConstraint.activate([
        
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            textInput.widthAnchor.constraint(equalToConstant: 250),
            textInput.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textInput.endEditing(true)
    }
    
}

#Preview {
    CreateTaskViewController()
}
