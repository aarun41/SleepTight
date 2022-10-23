//
//  ViewRouter.swift
//  SleepTight
//
//  Reference: https://blckbirds.com/ tutorials
//  Created by Aditi Arun on 10/22/22.
//

import Foundation
import SwiftUI

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .chooseTypeScreen
}
