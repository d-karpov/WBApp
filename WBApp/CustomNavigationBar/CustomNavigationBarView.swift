//
//  CustomNavigationBarView.swift
//  WBApp
//
//  Created by Денис Карпов on 04.07.2024.
//

import SwiftUI

struct CustomNavigationBarView: View {
	@ObservedObject var router: Router = .shared
	
	private var title: String {
		if let route = router.currentRoute() {
			return route.name
		}
		return router.selectedTab.name
	}
	
	private var isRootView: Bool {
		if router.currentRoute() != nil {
			return false
		}
		return true
	}
	
	var body: some View {
		HStack(spacing: 8) {
			isRootView ? AnyView(EmptyView()) : AnyView(BackNavigationButton())
			Text(title)
				.font(.subheading1())
				.foregroundStyle(.neutralActive)
				.frame(maxWidth: .infinity, alignment: .leading)
			switch router.currentRoute() {
			case .some(let route):
				switch route {
				case .contactDetails(_): AddTrailingButton(imageResource: .editProfile)
				}
			case .none:
				switch router.selectedTab {
				case .contacts:
					AddTrailingButton(imageResource: .addContactButton)
				case .settings:
					EmptyView()
				case .chats:
					AddTrailingButton(imageResource: .newChat)
					AddTrailingButton(imageResource: .editChatsList)
				}
			}
		}
		.padding(.vertical, 13)
		.frame(maxHeight: 30)
	}
}

struct AddTrailingButton: View {
	let imageResource: ImageResource
	
	var body: some View {
		Button(action: {}, label: {
			Image(imageResource)
				.frame(maxWidth: 24, maxHeight: 24)
		})
	}
}

struct BackNavigationButton: View {
	@ObservedObject var router: Router = .shared
	
	var body: some View {
		Button(action: router.backToRoot, label: {
			Image(.backButton)
				.frame(maxWidth: 24, maxHeight: 24)
		})
	}
}

#Preview {
	CustomNavigationBarView()
}
