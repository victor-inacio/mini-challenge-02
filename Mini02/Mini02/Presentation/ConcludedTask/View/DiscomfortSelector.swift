import UIKit

protocol DiscomfortSelectorDelegate: AnyObject {
    func onDiscomfortValueChange(discomfort: DiscomfortLevel) -> Void
}

class DiscomfortSelector: UIView {
    
    let discomfortStack = {
        let stack = StackView(axis: .horizontal, spacing: 10, alignment: .center)
        return stack
    }()
    
    weak var delegate: DiscomfortSelectorDelegate? = nil
    
    var allImages: [DiscomfortViewer] = []
    
    init() {
        super.init(frame: .zero)
        setupImages()
        
        select(view: allImages[0])
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: discomfortStack.widthAnchor),
            heightAnchor.constraint(equalTo: discomfortStack.heightAnchor),
        ])
    }
    
    private func setupImages() {
        var  discomforts: [DiscomfortLevel] = []
        do {
            discomforts = try DiscomfortLevel.getAll()
        } catch {
            fatalError()
        }
        
        for discomfort in discomforts {
            let viewer = DiscomfortViewer(discomfortLevel: discomfort)
            viewer.isUserInteractionEnabled = true
            viewer.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap(_:))))
            discomfortStack.addArrangedSubview(viewer)
            
            allImages.append(viewer)
        }
        
        addSubview(discomfortStack)
    }
    
    private func select(view: DiscomfortViewer) {
        onSelect(discomfort: view.discomfort)
        for image in allImages {
            image.layer.opacity = 0.5
            
            if (image == view) {
                image.layer.opacity = 1
                
            }
        }
    }
    
    private func onSelect(discomfort: DiscomfortLevel) {
        delegate?.onDiscomfortValueChange(discomfort: discomfort)
    }
    
    @objc private func onTap(_ sender: UITapGestureRecognizer? = nil) {
        guard let view = sender?.view as? DiscomfortViewer else {
            return
        }
        
        select(view: view)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


#Preview {
    DiscomfortSelector()
}
