//
//  Color+Extensions.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import SwiftUI

extension Color {
	static let purpleGradient: LinearGradient = LinearGradient(
		colors: [.gradientPurpleFrom, .gradientPurpleTo],
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
	
	
	static let blueGradient: LinearGradient = LinearGradient(
		colors: [.gradientBlueFrom, .gradientBlueTo],
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
	
	static let clearGradient: LinearGradient = LinearGradient(
		colors: [.clear],
		startPoint: .topLeading,
		endPoint: .bottomTrailing
	)
}
