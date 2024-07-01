//
//  TabBarItemView.swift
//  WBApp
//
//  Created by Денис Карпов on 01.07.2024.
//

import SwiftUI

struct TabBarItemView: View {
	@Binding var selectedTab: Tabs
	
	let tabItem: Tabs
	
	var body: some View {
		Button {
			withAnimation {
				selectedTab = tabItem
			}
		} label: {
			switch selectedTab == tabItem {
			case true: TabBarItemNamed(tabItem.name)
			case false: TabBarItemImage(tabItem.icon)
			}
		}
		.foregroundStyle(.neutralActive)
		.frame(maxWidth: .infinity, minHeight: 44)
	}
	
	@ViewBuilder
	private func TabBarItemImage(_ imageName: String) -> some View {
		Image(imageName)
			.resizable()
			.renderingMode(.template)
			.frame(width: 32, height: 32)
	}
	
	@ViewBuilder
	private func TabBarItemNamed(_ name: String) -> some View {
		Text(name)
			.font(.bodyText2())
			.foregroundStyle(.neutralActive)
			.padding(.bottom)
	}
}

#Preview {
	@State var selectedTab: Tabs = .contacts
	return TabBarItemView(selectedTab: $selectedTab, tabItem: .contacts)
}
