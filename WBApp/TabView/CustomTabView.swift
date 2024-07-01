//
//  MainTabView.swift
//  WBApp
//
//  Created by Денис Карпов on 23.06.2024.
//

import SwiftUI

struct CustomTabView: View {
	
	@StateObject var router: Router = .init()
	
	@State var frames: [CGRect] = []
	
	var body: some View {
		VStack(spacing: 0) {
			router.tabContent
				.frame(maxWidth: .infinity, maxHeight: .infinity)
			HStack {
				ForEach(Tabs.allCases, id: \.self) { item in
					TabBarItemView(selectedTab: $router.selectedTab, tabItem: item)
				}
			}
			.padding(.horizontal, 16)
			.padding(.top, 12)
			.background(.neutralWhite)
			.shadow(color: .black.opacity(0.04),radius: 20)
			.coordinateSpace(.named("TabBar"))
			.overlay() {
				SelectionPointer(router.selectedTabIndex)
			}
		}
		.onPreferenceChange(TabBarItemPreferenceKey.self) { frames in
			self.frames = frames
		}
	}
	
	@ViewBuilder
	private func SelectionPointer(_ at: Int) -> some View {
		Circle()
			.fill(.neutralActive)
			.frame(width: 4, height: 4)
			.position(
				x: getPointerCords(at).x,
				y: getPointerCords(at).y 
			)
			.animation(.smooth, value: at)
	}
	
	private func getPointerCords(_ at: Int) -> CGPoint {
		guard let frame = frames[safe: at] else {
			return .zero
		}
		return CGPoint(x: frame.midX, y: frame.maxY)
	}
}

#Preview {
	CustomTabView()
}
