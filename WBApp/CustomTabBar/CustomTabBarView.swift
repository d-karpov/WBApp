//
//  CustomTabBarView.swift
//  WBApp
//
//  Created by Денис Карпов on 23.06.2024.
//

import SwiftUI

struct CustomTabBarView: View {
	
	@StateObject var router: Router = .shared
	@Namespace private var namespace
	
	var body: some View {
		VStack(spacing: 0) {
			CustomNavigationBarView()
				.padding(.horizontal, 24)
				.padding(.bottom, 16)
			router.tabContent
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			HStack {
				ForEach(Tabs.allCases, id: \.self) { item in
					CustomTabBarItemView(selectedTab: $router.selectedTab, tabItem: item)
						.overlay(alignment: .bottom) {
							if item == router.selectedTab {
								selectionPointer
							}
						}
				}
			}
			.padding(.horizontal, 16)
			.padding(.top, 12)
			.background(.neutralWhite)
			.shadow(color: .black.opacity(0.04),radius: 20)
			.animation(.smooth(duration: 0.3), value: router.selectedTab)
		}
		.onOpenURL { url in
			router.handleDeeplink(url: url)
		}
	}
	
	@ViewBuilder
	private var selectionPointer: some View {
		Circle()
			.fill(.neutralActive)
			.frame(width: 4, height: 4)
			.matchedGeometryEffect(id: "selection", in: namespace)
	}

}

#Preview {
	CustomTabBarView()
}
