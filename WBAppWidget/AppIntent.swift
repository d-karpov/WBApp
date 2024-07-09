//
//  AppIntent.swift
//  WBAppWidget
//
//  Created by Denis on 07.07.2024.
//

import WidgetKit
import AppIntents

struct ConfigurationAppIntent: WidgetConfigurationIntent {
	static var title: LocalizedStringResource = "WBAppWidget Configuration Intent"
	
	@Parameter(title: "Selected Tab", default: Shared.TabLabels.chats)
	var selectedTab: Shared.TabLabels
	
	init(selectedTab: Shared.TabLabels) {
		self.selectedTab = selectedTab
	}
	
	init() { }
	
	func perform() async throws -> some IntentResult {
		Shared.shared.selectedTab = selectedTab
		return .result()
	}
}
