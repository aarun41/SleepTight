//
//  CalendarScreen.swift
//  SleepTight
//
//  Created by Aditi Arun on 10/22/22.
//

import SwiftUI

struct CalendarScreen: View {
    @State var data: [Int]
      
      var body: some View {
        VStack {
          CalendarView<CalendarCell>(items: $data)
          
          Button("Tap to add data!") {
            self.data.append(.random(in: 1...10))
          }
          .padding(.bottom)
        }
        .navigationBarTitle("Hello, CalendarView!", displayMode: .inline)
      }
}

var data = [Int](repeating: .random(in: 1...10), count: 2)

struct CalendarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CalendarScreen(data: data)
    }
}
