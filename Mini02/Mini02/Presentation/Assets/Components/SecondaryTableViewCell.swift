//
//  SecondaryTableViewCell.swift
//  Mini02
//
//  Created by Guilherme Nunes Lobo on 05/10/23.
//


import UIKit

protocol SecondaryTableViewCellDelegate: AnyObject {
    func onAddButtonTap(_ indexPath: IndexPath) -> Void
}

class SecondaryTableViewCell: UITableViewCell {
    
    override var isSelected: Bool {
        didSet {
            print(self.isSelected)
            self.addButton.setImage(isSelected ? .init(systemName: "minus") : .init(named: "plusButton"), for: .normal)
        }
    }
    
    var indexPath: IndexPath!

    weak var delegate: SecondaryTableViewCellDelegate?
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .cell
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let label =  {
        let label = Label(text: "", font: UIFont(name: "Nunito-Bold", size: 20))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        
        return label
    }()

    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "plusButton"), for: .normal)
        button.tintColor = .button
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        addSubview(background)

        self.backgroundColor = .clear
        
        let stack = StackView(axis: .horizontal)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = .init(top: 0, left: 30, bottom: 0, right: 30)
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(addButton)
        
        contentView.addSubview(stack)
        
        addButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)


        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            addButton.widthAnchor.constraint(equalToConstant: 40),
            
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])

    }

    @objc private func onTap() {
        delegate?.onAddButtonTap(indexPath)
    }
}
