//
//  Timer.swift
//  TestMaket
//
//  Created by Mac on 19.07.2023.
//

import Foundation

class DailyTaskScheduler {

    private var timer: Timer?

    private let targetHour: Int = 23
    private let targetMinute: Int = 59

    init() {
        scheduleDailyTask()
    }

    private func scheduleDailyTask() {
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: Date())

        dateComponents.hour = targetHour
        dateComponents.minute = targetMinute

        if let targetDate = calendar.date(from: dateComponents) {
            let timeDifference = targetDate.timeIntervalSince(Date())

            timer = Timer.scheduledTimer(withTimeInterval: timeDifference, repeats: false) { [weak self] _ in
                self?.performDailyTask()
            }
        }
    }

    private func performDailyTask() {
        UserDefaults.standard.removeObject(forKey: Keys.progress.rawValue)

        scheduleDailyTask()
    }

    deinit {
        timer?.invalidate()
    }
}
