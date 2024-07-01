//
//  Font+Extensions.swift
//  WBApp
//
//  Created by Денис Карпов on 27.06.2024.
//

import SwiftUI

extension Font {
	static func heading1(_ size: CGFloat = 32) -> Font {
		.system(size: size, weight: .bold)
	}
	
	static func heading2(_ size: CGFloat = 24) -> Font {
		.system(size: size, weight: .bold)
	}
	
	static func subheading1(_ size: CGFloat = 18) -> Font {
		.system(size: size, weight: .semibold)
	}
	
	static func subheading2(_ size: CGFloat = 16) -> Font {
		.system(size: size, weight: .semibold)
	}
	
	static func bodyText1(_ size: CGFloat = 14) -> Font {
		.system(size: size, weight: .semibold)
	}
	
	static func bodyText2(_ size: CGFloat = 14) -> Font {
		.system(size: size, weight: .regular)
	}
	
	static func metadata1(_ size: CGFloat = 12) -> Font {
		.system(size: size, weight: .regular)
	}
	
	static func metadata2(_ size: CGFloat = 10) -> Font {
		.system(size: size, weight: .regular)
	}
	
	static func metadata3(_ size: CGFloat = 10) -> Font {
		.system(size: size, weight: .semibold)
	}
}

