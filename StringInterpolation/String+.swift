//
//  String+.swift
//  WBApp
//
//  Created by Denis on 24.07.2024.
//

import SwiftUI

extension String.StringInterpolation {
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
