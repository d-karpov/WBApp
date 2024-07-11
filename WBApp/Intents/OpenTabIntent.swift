//
//  OpenContactsIntent.swift
//  WBApp
//
//  Created by Denis on 06.07.2024.
//

import AppIntents
import SwiftUI

struct OpenTabIntent: AppIntent {
	
	static var title: LocalizedStringResource = "Открыть нужную вкладку WBApp"
	static var openAppWhenRun: Bool = true
	
	@StateObject private var router: Router = .shared
	@Parameter(title: "Вкладка") var tab: TabOption
	
	enum TabOption: String, AppEnum {
		case contacts
		case chats
		case settings
		
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
		
		func toTab() -> Tabs {
			switch self {
			case .contacts: return .contacts
			case .chats: return .chats
			case .settings: return .settings
			}
		}
	}
	
	@MainActor
	func perform() async throws -> some IntentResult {
		router.selectedTab = tab.toTab()
		return .result()
	}
}
