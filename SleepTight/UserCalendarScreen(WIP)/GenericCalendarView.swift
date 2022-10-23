//
//  GenericCalendarView.swift
//  SleepTight
//
//  Reference: https://medium.com/swlh/porting-uicollectionview-to-swiftui-afd8fc036323
//  Created by Aditi Arun on 10/22/22.
//

import UIKit.UICollectionView

public class GenericCalendarView<CellType: UICollectionViewCell & Configurable>: UICollectionView {
  public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    super.init(frame: frame, collectionViewLayout: layout)
    sharedInit()
  }
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    sharedInit()
  }
  
  private func sharedInit() {
    backgroundColor = .clear
    register(CellType.self, forCellWithReuseIdentifier: CellType.stringIdentifier)
  }
}
