//
//  WalkthroughScreen_LabelView.swift
//  WBApp
//
//  Created by Денис Карпов on 06.06.2024.
//

import SwiftUI

struct WalkthroughScreen_LabelView: View {
	var body: some View {
		Label {
			Text("Общайтесь с друзьями и близкими легко")
				.font(.heading2())
				.foregroundStyle(.neutralActive)
		} icon: {
			Image(.walkthrough)
		}
		.labelStyle(WalkthroughLabelStyle())
		.multilineTextAlignment(.center)
	}
}

struct WalkthroughLabelStyle: LabelStyle {
	func makeBody(configuration: Configuration) -> some View {
		VStack(spacing: 42) {
			configuration.icon
			configuration.title
		}
		.frame(maxWidth: 280)
	}
}

#Preview {
	WalkthroughScreen_LabelView()
}
