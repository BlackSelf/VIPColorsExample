//
//  ColorTableViewCell.swift
//  Colors
//
//  Created by Alexander Vorobyev on 28/08/2019.
//  Copyright © 2019 Utkonos. All rights reserved.
//

import UIKit
import Reusable

class ColorTableViewCell: UITableViewCell, Reusable {
    
    private lazy var colorView = UIView()
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = UIColor.darkText
        label.numberOfLines = 1
        return label
    }()
    
    var color: UIColor? {
        get {
            return colorView.backgroundColor
        }
        set {
            colorView.backgroundColor = newValue
        }
    }
    
    var title: String? {
        get {
            return titleLabel.text
        }
        set {
            titleLabel.text = newValue
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        addSubview(colorView)
        colorView.size(CGSize(width: 48, height: 48))
        colorView.edges(to: self, excluding: .right, insets: .uniform(16))
        
        addSubview(titleLabel)
        titleLabel.leadingToTrailing(of: colorView, offset: 16)
        titleLabel.edges(to: self, excluding: .left, insets: .uniform(16))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        let color = colorView.backgroundColor
        super.setSelected(selected, animated: animated)
        colorView.backgroundColor = color
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let color = colorView.backgroundColor
        super.setHighlighted(highlighted, animated: animated)
        colorView.backgroundColor = color
    }

}
