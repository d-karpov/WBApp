//
//  VerificationView.swift
//  WBApp
//
//  Created by Денис Карпов on 06.06.2024.
//

import SwiftUI

struct VerificationScreen: View {
	
	@Environment(\.dismiss) var dismiss
	
	var body: some View {
		Button("Press for dismiss") {
			dismiss()
		}
		.font(.largeTitle)
		.foregroundStyle(.neutralActive)
	}
}

#Preview {
	VerificationScreen()
}
