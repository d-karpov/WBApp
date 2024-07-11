//
//  MockContacts.swift
//  WBApp
//
//  Created by Денис Карпов on 03.07.2024.
//

import Foundation

extension Contact {
	static var mockContacts: [Contact] {
		[
			.init(
				name: "Анастасия",
				surname: "Иванова",
				contactImage: "userImageMock3",
				socialNetworks: SocialNetworks.allCases,
				lastSeen: Calendar.autoupdatingCurrent.date(byAdding: .day, value: -1, to: .now)!,
				isOnline: false,
				isHasStory: false
			),
			.init(
				name: "Петя",
				contactImage: "userImageMock4",
				socialNetworks: SocialNetworks.allCases,
				lastSeen: .now,
				isOnline: true,
				isHasStory: false
			),
			.init(
				name: "Маман",
				contactImage: "userImageMock2",
				socialNetworks: [.facebook, .instagram],
				lastSeen: Calendar.autoupdatingCurrent.date(byAdding: .hour, value: -3, to: .now)!,
				isOnline: false,
				isHasStory: true
			),
			.init(
				name: "Арбуз",
				surname: "Дыня",
				contactImage: "userImageMock1",
				socialNetworks: SocialNetworks.allCases,
				lastSeen: .now,
				isOnline: true,
				isHasStory: false
			),
			.init(
				name: "Иван",
				surname: "Иванов",
				contactImage: nil,
				socialNetworks: [.twitter, .linkedin],
				lastSeen: .now,
				isOnline: true,
				isHasStory: false
			),
			.init(
				name: "Лиса",
				surname: "Алиса",
				contactImage: nil,
				lastSeen: Calendar.autoupdatingCurrent.date(byAdding: .minute, value: -30, to: .now)!,
				isOnline: false,
				isHasStory: true
			)
		]
	}
}
