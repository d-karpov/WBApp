//
//  ContactsScreen.swift
//  WBApp
//
//  Created by Денис Карпов on 23.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
	
	@ObservedObject var router: Router = .shared
	@State var contacts: [Contact]
	@State var searchText: String = ""
	@FocusState private var searchIsFocused: Bool
	
	var body: some View {
		NavigationStack(path: $router.path) {
			ScrollView {
				LazyVStack(spacing: 16) {
					CustomSearchBarView(searchText: $searchText)
						.focused($searchIsFocused)
					ForEach(filterContacts(byName: searchText)) { contact in
						ContactsScreen_RowView(contact: contact)
							.onTapGesture {
								router.navigateTo(.contactDetails(contact))
							}
					}
				}
				.navigationDestination(for: Routes.self) { route in
					route.content
				}
				.padding(.horizontal, 24)
			}
			.onTapGesture {
				searchIsFocused = false
			}
		}
	}
	
	private func filterContacts(byName: String) -> [Contact] {
		if byName != "" {
			return contacts.filter { contact in
				contact.fullName.localizedCaseInsensitiveContains(byName)
			}
		}
		return contacts
	}
}

#Preview {
	ContactsScreen(contacts: Contact.mockContacts)
}
