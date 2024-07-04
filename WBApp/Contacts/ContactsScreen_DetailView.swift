//
//  ContactsScreen_DetailView.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import SwiftUI

struct ContactsScreen_DetailView: View {
	let contact : Contact
	
	var body: some View {
		VStack(spacing: 20) {
			contactImage
				.frame(width: 200, height: 200)
			VStack {
				Text(contact.fullName)
					.font(.heading2())
					.foregroundStyle(.neutralActive)
				Text(contact.phone != nil ? "" : "+7-999-999-99-99")
					.font(.bodyText2())
					.foregroundStyle(.neutralDisabled)
			}
		}
		.padding(.top, 46)
		Spacer()
	}
	
	@ViewBuilder
	private var contactImage: some View {
		switch contact.contactImage {
		case .some(let imageName):
			Image(imageName)
				.resizable()
				.scaledToFill()
				.clipShape(.circle)
		case .none:
			ZStack {
				Color.neutralSecondaryBG
					.clipShape(.circle)
				Image(.contactImagePlaceholder)
					.resizable()
					.renderingMode(.template)
					.foregroundStyle(.neutralActive)
					.scaledToFit()
					.frame(maxWidth: 112, maxHeight: 112)
			}
		}
	}
}

#Preview {
	ContactsScreen_DetailView(contact: Contact.mockContacts[4])
}
