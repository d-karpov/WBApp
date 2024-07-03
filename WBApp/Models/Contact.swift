//
//  Contact.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import Foundation


struct Contact: Hashable, Identifiable {
	var id = UUID()
	var name: String
	var surname: String?
	var fullName: String {
		name + " " + (surname ?? "")
	}
	var initials: String {
		getInitials()
	}
	var contactImage: String?
	var lastSeen: Date
	var lastSeenDescription: String {
		switch isOnline {
		case true: return "Online"
		case false: return makeLastSeenDescription()
		}
	}
	var isOnline: Bool
	var isHasStory: Bool
}


private extension Contact {
	func makeLastSeenDescription() -> String {
		let intervalValue: DateComponents = Calendar.autoupdatingCurrent.dateComponents(
			[.year, .month, .weekOfYear, .day, .hour, .minute],
			from: lastSeen,
			to: .now
		)
		var intervalDescription: String = ""
		switch true {
		case intervalValue.year != 0: intervalDescription = "\(intervalValue.year, units: "year")"
		case intervalValue.month != 0: intervalDescription = "\(intervalValue.month, units: "month")"
		case intervalValue.weekOfYear != 0: intervalDescription = "\(intervalValue.weekOfYear, units: "week")"
		case intervalValue.day != 0:
			if let day = intervalValue.day, day > 1 {
				intervalDescription = "\(day, units: "day")"
			} else {
				return "Last seen yesterday"
			}
		case intervalValue.hour != 0: intervalDescription = "\(intervalValue.hour, units: "hour")"
		case intervalValue.minute != 0: intervalDescription = "\(intervalValue.minute, units: "minute")"
		default: return "Last seen resent"
		}
		return "Last seen \(intervalDescription) ago"
	}
	
	func getInitials() -> String {
		if let firstLetter = name.first, let secondLetter = surname?.first {
			return String(describing: firstLetter) + String(describing: secondLetter)
		}
		return ""
	}
}
