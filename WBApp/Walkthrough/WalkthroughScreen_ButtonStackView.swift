//
//  WalkthroughScreen_ButtonStackView.swift
//  WBApp
//
//  Created by Денис Карпов on 06.06.2024.
//

import SwiftUI

struct WalkthroughScreen_ButtonStackView: View {
	var action: () -> Void
	
	var body: some View {
		VStack(spacing: 18) {
			Button("Пользовательское соглашение", action: { })
				.font(.system(size: 14, weight: .medium))
				.foregroundStyle(.fontNeutral)
			Button(action: action) {
				Text("Начать общаться")
					.font(.system(size: 16, weight: .medium))
					.frame(maxWidth: .infinity)
			}
			.padding(.horizontal, 24)
			.buttonBorderShape(.capsule)
			.buttonStyle(.borderedProminent)
			.controlSize(.extraLarge)
			.tint(.defaultButton)
		}
	}
}

#Preview {
	WalkthroughScreen_ButtonStackView(action: { })
}
