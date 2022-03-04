//
//  UpdateViewModel.swift
//  Timer WatchKit Extension
//
//  Created by peter wi on 3/4/22.
//

import Foundation
import SwiftUI

final class UpdateViewModel: ObservableObject {
    @Published var timeInterval: TimeInterval = TimeInterval()
    @Published var timePassed: Bool = false
    @Published var now: Date = Date()
    let dDay: Date = Calendar.current.date(
        from: DateComponents(timeZone: TimeZone(identifier: "America/Los_Angeles"),
                             year: 2022,
                             month: 3,
                             day: 8,
                             hour: 10,
                             minute: 0,
                             second: 0))!
    let formatter = DateComponentsFormatter()
    
    var timer: Timer?
    
    init() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.refresh()
        })
    }
    deinit {
        timer?.invalidate()
    }
    
    func refresh() {
        now = Date()
        timeInterval = now.distance(to: dDay)
        if timeInterval.isLessThanOrEqualTo(1.5) {
            withAnimation {
                timePassed = true
                timeInterval = 0
            }
        }
    }
    
    func getTimeInterval() -> String {
        return formatter.string(from: timeInterval) == "0" ? "00:00:00" : formatter.string(from: timeInterval)!
    }
}
