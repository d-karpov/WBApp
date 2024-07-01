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
	
	var isSelected: Bool {
		selectedTab == tabItem
	}
	
	var body: some View {
		Button {
			withAnimation {
				selectedTab = tabItem
			}
		} label: {
			switch isSelected {
			case true:
				TabBarItemNamed(tabItem.name)
			case false:
				TabBarItemImage(tabItem.icon)
			}
		}
		.foregroundStyle(.neutralActive)
		.frame(maxWidth: .infinity, minHeight: 44)
		.background(TabBarItemPreferenceViewSetter())
	}
	
	
	@ViewBuilder
	private func TabBarItemImage(_ imageName: String) -> some View {
		Image(imageName)
			.resizable()
			.renderingMode(.template)
			.frame(width: 32, height: 32)
			.padding(.horizontal, 13)
			.padding(.vertical, 6)
	}
	
	@ViewBuilder
	private func TabBarItemNamed(_ name: String) -> some View {
		Text(name)
			.font(.bodyText2())
			.foregroundStyle(.neutralActive)
			.padding(.bottom)
	}
}

struct TabBarItemPreferenceKey: PreferenceKey {
	static var defaultValue: [CGRect] = []
	
	static func reduce(value: inout [CGRect], nextValue: () -> Value) {
		value.append(contentsOf: nextValue())
	}
}

struct TabBarItemPreferenceViewSetter: View {
	var body: some View {
		GeometryReader { geometry in
			Rectangle()
				.fill(Color.clear)
				.preference(
					key: TabBarItemPreferenceKey.self,
					value: [geometry.frame(in: .named("TabBar"))]
				)
		}
	}
}

#Preview {
	@State var selectedTab: Tabs = .contacts
	return TabBarItemView(selectedTab: $selectedTab, tabItem: .contacts)
}
