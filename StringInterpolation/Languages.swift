//
//  Languages.swift
//  WBApp
//
//  Created by Denis on 24.07.2024.
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
