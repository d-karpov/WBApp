//
//  ContactsScreen.swift
//  WBApp
//
//  Created by Денис Карпов on 23.06.2024.
//

import SwiftUI

struct ContactsScreen: View {
	
	@State var contacts: [Contact]
	
	var body: some View {
		VStack(spacing: 16) {
			List(contacts) { contact in
				ContactsScreen_RowView(contact: contact)
					.alignmentGuide(.listRowSeparatorTrailing) { dimension in
						dimension.width
					}
					.alignmentGuide(.listRowSeparatorLeading) { dimension in
						0
					}
			}
			.listStyle(.plain)
		}
	}
}

#Preview {
	ContactsScreen(contacts: Contact.mockContacts)
}
