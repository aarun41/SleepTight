//
//  CalendarConfigurable.swift
//  SleepTight
//
//  Reference: https://medium.com/swlh/porting-uicollectionview-to-swiftui-afd8fc036323
//  Created by Aditi Arun on 10/22/22.
//

import UIKit.UICollectionViewCell

public extension UICollectionViewCell {
  static var stringIdentifier: String { String(describing: Self.self) }
}

public protocol Configurable {
  associatedtype DataType
  func configure(using data: DataType) -> Void
}
