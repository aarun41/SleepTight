//
//  CalendarCell.swift
//  SleepTight
//
//  Reference: https://medium.com/swlh/porting-uicollectionview-to-swiftui-afd8fc036323
//  Created by Aditi Arun on 10/22/22.
//

import UIKit.UICollectionViewCell

public class CalendarCell<DataType: UIView>: UICollectionViewCell, Configurable {
    private let label = UILabel()
    
    private let subview = UIStackView()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        sharedInit()
    }
    
    private func sharedInit() {
        backgroundColor = UIColor.blue.withAlphaComponent(0.4)
        layer.cornerRadius = Swift.min(frame.width, frame.height) * 0.2
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1
        clipsToBounds = false
        
        subview.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        addSubview(subview)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subview.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        subview.axis = .vertical

    }
    
    public func configure(using data: DataType) {
        label.text = data.description
    }
      
    public override func prepareForReuse() {
        label.text = .none
    }
}
