//
//  Shared.swift
//  WBApp
//
//  Created by Denis on 07.07.2024.
//

import SwiftUI
import AppIntents


final class Shared {
	static let shared: Shared = .init()
	
	var selectedTab: TabLabels?
	
	private init() {}
	
	enum TabLabels: String, AppEnum, CaseIterable {
		case contacts
		case chats
		case settings
		
		var name: String {
			switch self {
			case .contacts: "Контакты"
			case .chats: "Чаты"
			case .settings: "Ещё"
			}
		}
		
		static var typeDisplayRepresentation: TypeDisplayRepresentation {
			"Вкладки"
		}
		
		static var caseDisplayRepresentations: [Self: DisplayRepresentation] {
			[
				.contacts: "Контакты",
				.chats: "Чаты",
				.settings: "Ещё"
			]
		}
	}
	
	func getTabByIndex(_ index: Int) -> TabLabels {
		if index < 0 {
			return .settings
		}
		if TabLabels.allCases.indices ~= index {
			return TabLabels.allCases[index]
		} else {
			return .contacts
		}
	}
}
