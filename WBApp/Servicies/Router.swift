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
		case .contacts: ContactsScreen(contacts: Contact.mockContacts)
		case .chats: ChatsScreen()
		case .settings: SettingsScreen()
		}
	}
}

enum Routes: Hashable {
	case contactDetails(Contact)
	
	var name: String {
		switch self {
		case .contactDetails(_): "Профиль"
		}
	}
}

final class Router: ObservableObject {
	static let shared: Router = .init(selectedTab: .contacts)
	
	@Published var selectedTab: Tabs {
		didSet {
			backToRoot()
		}
	}
	@Published var path: [Routes] = []
	
	var tabContent: some View {
		selectedTab.content
	}
	
	func navigateTo(_ route: Routes) {
		switch route {
		case .contactDetails(let contact):
			showDetailContact(contact)
		}
	}
	
	func currentRoute() -> Routes? {
		guard let route = path.last else { return nil }
		return route
	}
	
	private func showDetailContact(_ contact: Contact) {
		path.append(.contactDetails(contact))
	}
	
	func backToRoot() {
		path.removeAll()
	}
	
	private init(selectedTab: Tabs) {
		self.selectedTab = selectedTab
	}
}
