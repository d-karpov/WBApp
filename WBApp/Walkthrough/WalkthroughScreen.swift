//
//  Onboarding.swift
//  WBApp
//
//  Created by Денис Карпов on 05.06.2024.
//

import SwiftUI

struct WalkthroughScreen: View {
	@State var tabViewPresented = false
	
	var body: some View {
			VStack {
				Spacer()
				WalkthroughScreen_LabelView()
				Spacer()
				WalkthroughScreen_ButtonStackView {
					tabViewPresented.toggle()
				}
			}
			.padding(.vertical, 20)
			.fullScreenCover(isPresented: $tabViewPresented) {
				CustomTabView()
			}
	}
}

#Preview {
	WalkthroughScreen()
}
