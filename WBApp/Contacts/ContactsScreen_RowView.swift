//
//  ContactsScreen_RawView.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import SwiftUI

struct ContactsScreen_RowView: View {
	@State var contact: Contact
	
	var body: some View {
		VStack(spacing: 12) {
			HStack(alignment: .top, spacing: 12) {
				ContactsScreen_AvatarView(
					contactImage: contact.contactImage,
					initials: contact.initials,
					isOnline: contact.isOnline,
					isHasStory: contact.isHasStory
				)
				titleView
				Spacer()
			}
			.background(.neutralWhite)
			Divider()
		}
		.frame(minHeight: 68, alignment: .leading)
	}
	
	@ViewBuilder
	var titleView: some View {
		VStack(alignment:.leading, spacing: 2) {
			Text(contact.fullName)
				.font(.bodyText1())
				.foregroundStyle(.neutralActive)
				.frame(maxHeight: 24)
			Text(contact.lastSeenDescription)
				.font(.metadata1())
				.foregroundStyle(.neutralDisabled)
				.frame(maxHeight: 20)
		}
	}
}

#Preview {
	ContactsScreen_RowView(contact: Contact.mockContacts[3])
}
