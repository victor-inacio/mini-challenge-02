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

class SecondaryTableViewCell: SwipableTableViewCell {
    
    override var isSelected: Bool {
        didSet {
            self.addButton.setImage(isSelected ? .init(systemName: "checkmark") : .init(named: "plusButton"), for: .normal)
        }
    }
    
    var indexPath: IndexPath!
    var task: Task! {
        didSet {
            label.text = task.name
        }
    }
    
    weak var delegateB: SecondaryTableViewCellDelegate?
    
    private let background: UIView = {
        let view = UIView()
        view.backgroundColor = .cell
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let label =  {
        let label = Label(localizedTextKey: "", font: UIFont(name: "Nunito-Bold", size: 20))
        label.numberOfLines = 0
        label.numberOfLines = 3
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
        swipeInit()
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
        background.layer.shadowColor = UIColor.black.cgColor
        background.layer.shadowOffset = CGSize(width: 0, height: 2)
        background.layer.shadowRadius = 4
        background.layer.shadowOpacity = 0.3
        background.layer.masksToBounds = false
        contentView.addSubview(stack)
        
        addButton.addTarget(self, action: #selector(onTap), for: .touchUpInside)


        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            background.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            background.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            background.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            addButton.widthAnchor.constraint(equalToConstant: 40),
            addButton.heightAnchor.constraint(equalToConstant: 80),

            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor),
            stack.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])

    }

    @objc private func onTap() {
        delegateB?.onAddButtonTap(indexPath)
    }
}
