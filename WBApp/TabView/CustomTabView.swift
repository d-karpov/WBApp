//
//  MainTabView.swift
//  WBApp
//
//  Created by Денис Карпов on 23.06.2024.
//

import SwiftUI

struct CustomTabView: View {
	
	@StateObject var router: Router = .init()
	@Namespace private var namespace
	
	var body: some View {
		VStack(spacing: 0) {
			router.tabContent
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			HStack {
				ForEach(Tabs.allCases, id: \.self) { item in
					TabBarItemView(selectedTab: $router.selectedTab, tabItem: item)
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
			.animation(.smooth(duration: 0.2), value: router.selectedTab)
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
	CustomTabView()
}
