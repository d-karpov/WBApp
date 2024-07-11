//
//  String+Extensions.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import Foundation

//MARK: - for Common app
extension String.StringInterpolation {
	mutating func appendInterpolation(_ value: Int?, units: String) {
		if let value = value {
			appendInterpolation("\(value) \(units)")
			if value > 1 {
				appendLiteral("s")
			}
		}
	}
	
//MARK: - for DatePicker
	mutating func appendInterpolation(language: Languages) {
		switch language {
		case .ru: appendLiteral("Выберите текущую дату:")
		case .us: appendLiteral("Select the current date:")
		case .it: appendLiteral("Selezionare la data corrente:")
		case .fr: appendLiteral("Sélectionner la date du jour:")
		case .es: appendLiteral("Seleccione la fecha actual:")
		}
	}
	
	mutating func appendInterpolation(day: Days, language: Languages) {
		guard let dayIndex = Days.allCases.firstIndex(of: day) else { return }
		appendLiteral(language.namesSet[dayIndex])
	}
	
	mutating func appendInterpolation(_ date: Date, language: Languages) {
		let formatter = DateFormatter()
		formatter.locale = language.localeIdentifier
		formatter.dateStyle = .long
		formatter.timeStyle = .none
		appendLiteral(formatter.string(from: date))
	}
	
	mutating func appendInterpolation(spellOut date: Date, language: Languages) {
		var calendar = Calendar.current
		calendar.locale = language.localeIdentifier
	
		let dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
		
		let numberFormatter = NumberFormatter()
		numberFormatter.locale = language.localeIdentifier
		numberFormatter.numberStyle = .spellOut
		
		guard let day = dateComponents.day,
			  let month = dateComponents.month,
			  let year = dateComponents.year
		else {
			return
		}
		
		guard let dayString = numberFormatter.string(from: NSNumber(integerLiteral: day)),
			  let yearString = numberFormatter.string(from: NSNumber(integerLiteral: year))
		else {
			return
		}
		
		let monthString = calendar.monthSymbols[month - 1]
		
		appendInterpolation("\(dayString) \(monthString) \(yearString)")
		
	}
	
}
