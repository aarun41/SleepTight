//
//  CalendarView.swift
//  SleepTight
//
//  Reference: https://medium.com/swlh/porting-uicollectionview-to-swiftui-afd8fc036323
//  Created by Aditi Arun on 10/22/22.
//

import UIKit.UICollectionView
import SwiftUI

public struct CalendarView<CellType: UICollectionViewCell & Configurable>: UIViewRepresentable {
  @Binding public var items: [CellType.DataType]
  private let layout: UICollectionViewFlowLayout
  
  public init(items: Binding<[CellType.DataType]>) {
    self._items = items
    self.layout = UICollectionViewFlowLayout()
  }
  
  public func updateUIView(_ uiView: GenericCalendarView<CellType>, context: Context) {
    uiView.reloadData()
  }
  
  public func makeUIView(context: Context) -> GenericCalendarView<CellType> {
    let view = GenericCalendarView<CellType>.init(frame: .zero, collectionViewLayout: layout)
    view.dataSource = context.coordinator
    view.delegate = context.coordinator
    return view
  }
  
  public func makeCoordinator() -> CalendarViewCoordinator<CellType> {
    CalendarViewCoordinator($items)
  }
}
