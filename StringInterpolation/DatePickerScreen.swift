//
//  DatePickerScreen.swift
//  WBApp
//
//  Created by Denis on 11.07.2024.
//

import SwiftUI

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
