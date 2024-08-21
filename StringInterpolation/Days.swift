//
//  Days.swift
//  WBApp
//
//  Created by Denis on 24.07.2024.
//

import SwiftUI

enum Days: Int, CaseIterable {
	case beforeYesterday = -2
	case yesterday = -1
	case today = 0
	case tomorrow = 1
	case afterTomorrow = 2
	
	static func dateOffset(day: Days, to: Date) -> Date {
		Calendar.current.date(
			byAdding: .day,
			value: day.rawValue,
			to: to
		) ?? .now
	}
}
