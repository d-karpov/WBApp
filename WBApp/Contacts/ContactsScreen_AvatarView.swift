//
//  ContactsScreen_AvatarView.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import SwiftUI

struct ContactsScreen_AvatarView: View {
	let contactImage: String?
	let initials: String
	let isOnline: Bool
	let isHasStory: Bool
	
	var body: some View {
		storyStroke
			.overlay(avatar)
			.overlay(alignment: .topTrailing) {
				if isOnline {
					onlineBadge
				}
			}
	}
	
	@ViewBuilder
	private var avatar: some View {
		switch contactImage {
		case .some(let imageName):
			Image(imageName)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(maxWidth: 48, maxHeight: 48)
				.clipShape(RoundedRectangle(cornerRadius: 16))
		case .none: avatarPlaceholder
		}
	}
	
	@ViewBuilder
	private var avatarPlaceholder: some View {
		RoundedRectangle(cornerRadius: 16)
			.fill(.brandDefault)
			.frame(maxWidth: 48, maxHeight: 48)
			.overlay(alignment: .center) {
				Text(initials)
					.font(.bodyText1())
					.foregroundStyle(.neutralWhite)
			}
	}
	
	@ViewBuilder
	private var storyStroke: some View {
		var strokeColor: LinearGradient {
			if isHasStory {
				return contactImage != nil ? Color.blueGradient : Color.purpleGradient
			}
			return Color.clearGradient
		}
		
		RoundedRectangle(cornerRadius: 18)
			.stroke(strokeColor, lineWidth: 2)
			.background(.clear)
			.frame(maxWidth: 56, maxHeight: 56)
	}
	
	@ViewBuilder
	private var onlineBadge: some View {
		Circle()
			.fill(.accentSuccess)
			.stroke(.neutralWhite, lineWidth: 2)
			.frame(width: 14, height: 14)
	}
}

#Preview {
	ContactsScreen_AvatarView(
		contactImage: "userImageMock2",
		initials: "ИИ",
		isOnline: false,
		isHasStory: true
	)
}
