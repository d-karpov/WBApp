//
//  Router.swift
//  WBApp
//
//  Created by Денис Карпов on 01.07.2024.
//

import SwiftUI

enum Tabs: Hashable, CaseIterable {
	case contacts
	case chats
	case settings
	
	var icon: String {
		switch self {
		case .contacts: "contacts"
		case .chats: "chats"
		case .settings: "settings"
		}
	}
	
	var name: String {
		switch self {
		case .contacts: "Контакты"
		case .chats: "Чаты"
		case .settings: "Ещё"
		}
	}
	
	@ViewBuilder
	var content: some View {
		switch self {
		case .contacts: ContactsScreen()
		case .chats: ChatsScreen()
		case .settings: SettingsScreen()
		}
	}
	
	func getIndex() -> Int {
		guard let index = Tabs.allCases.firstIndex(of: self) else {
			return 0
		}
		return index
	}
}

final class Router: ObservableObject {
	@Published var selectedTab: Tabs = .contacts
	
	var tabContent: some View {
		selectedTab.content
	}
	
	var selectedTabIndex: Int {
		selectedTab.getIndex()
	}
}
