//
//  Router.swift
//  WBApp
//
//  Created by Денис Карпов on 01.07.2024.
//

import SwiftUI

// MARK: - Tabs settings
enum Tabs: String, Hashable, CaseIterable {
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

// MARK: - Navigation routes settings
enum Routes: Hashable {
	case contactDetails(Contact)
	
	var name: String {
		switch self {
		case .contactDetails(_): "Профиль"
		}
	}
	
	@ViewBuilder
	var content: some View {
		switch self {
		case .contactDetails(let contact): ContactsScreen_DetailView(contact: contact)
		}
	}
}

// MARK: - Router
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
			path.append(.contactDetails(contact))
		}
	}
	
	func currentRoute() -> Routes? {
		guard let route = path.last else { return nil }
		return route
	}
	
	func previousPath() {
		path.removeLast()
	}
	
	func handleDeeplink(url: URL) {
		if url.scheme == "wbapp" {
			switch url.host {
			case Tabs.contacts.rawValue: selectedTab = .contacts
			case Tabs.chats.rawValue: selectedTab = .chats
			case Tabs.settings.rawValue: selectedTab = .settings
			default:
				break
			}
		}
	}
	
	private func backToRoot() {
		path.removeAll()
	}
	
	private init(selectedTab: Tabs) {
		self.selectedTab = selectedTab
	}
}
