//
//  DatePickerScreen.swift
//  WBApp
//
//  Created by Denis on 11.07.2024.
//

import SwiftUI

enum Languages: CaseIterable, Hashable, Identifiable {
	var id: Self { self }
	case ru, us, it, fr, es
	
	var banner: String {
		switch self {
		case .ru: return "🇷🇺"
		case .us: return "🇺🇸"
		case .it: return "🇮🇹"
		case .fr: return "🇫🇷"
		case .es: return "🇪🇸"
		}
	}
	
	var localeIdentifier: Locale {
		switch self {
		case .ru: return .init(identifier: "ru_RU")
		case .us: return .init(identifier: "us_US")
		case .it: return .init(identifier: "it_IT")
		case .fr: return .init(identifier: "fr_FR")
		case .es: return .init(identifier: "es_ES")
		}
	}
	
	var namesSet: [String] {
		switch self {
		case .ru: return ["Позавчера", "Вчера", "Сегодня", "Завтра", "После завтра"]
		case .us: return ["Before Yesterday", "Yesterday", "Today", "Tomorrow", "After Tomorrow" ]
		case .it: return ["L'altro ieri", "Ieri", "Oggi", "Domani", "Dopo domani"]
		case .fr: return ["Avant-hier", "Hier", "Aujourd'hui", "Demain", "Après-demain" ]
		case .es: return ["Anteayer", "Ayer", "Hoy", "Mañana", "Pasado mañana" ]
		}
	}
}

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

struct DatePickerScreen: View {
	@State var selectedDate: Date = .now
	@State var selectedLanguage: Languages = .ru
	@State var isSpellOut: Bool = false
	
	var body: some View {
		VStack(alignment: .leading, spacing: 16) {
			DatePicker("\(language: selectedLanguage)", selection: $selectedDate, displayedComponents: .date)
				.datePickerStyle(.automatic)
				.font(.subheading2())
				.foregroundStyle(.neutralActive)
				.environment(\.locale, selectedLanguage.localeIdentifier)
			Picker("Language",selection: $selectedLanguage) {
				banners
			}
			.pickerStyle(.segmented)
			Toggle("Spell Out", isOn: $isSpellOut)
			dates
		}
		.padding(.horizontal, 16)
		
	}
	
	@ViewBuilder
	var banners: some View {
		ForEach(Languages.allCases) { lang in
			Text(lang.banner)
		}
	}
	
	@ViewBuilder
	var dates: some View {
		ForEach(Days.allCases, id: \.self) { day in
			let date = Days.dateOffset(day: day, to: selectedDate)
			let isSelectedDate = date == selectedDate
			VStack(alignment: .leading,spacing: 10) {
				Text("\(day: day, language: selectedLanguage)")
					.font(.bodyText1(20))
				Text(isSpellOut ? "\(spellOut: date, language: selectedLanguage)" : "\(date, language: selectedLanguage)" )
					.font(.bodyText1())
					.fontWeight(isSelectedDate ? .bold : .regular)
			}
			.foregroundStyle(isSelectedDate ? .red : .neutralActive )
		}
	}
	
}

#Preview {
	DatePickerScreen()
}
