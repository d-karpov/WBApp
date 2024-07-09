//
//  WBAppWidget.swift
//  WBAppWidget
//
//  Created by Denis on 07.07.2024.
//

import WidgetKit
import SwiftUI

struct Provider: AppIntentTimelineProvider {
	func placeholder(in context: Context) -> WBAppEntry {
		WBAppEntry(date: .now, selectedTab: .chats)
	}
	
	func snapshot(for configuration: ConfigurationAppIntent, in context: Context) async -> WBAppEntry {
		WBAppEntry(date: .now, selectedTab: configuration.selectedTab)
	}
	
	func timeline(for configuration: ConfigurationAppIntent, in context: Context) async -> Timeline<WBAppEntry> {
		let entry = WBAppEntry(date: .now, selectedTab: Shared.shared.selectedTab ?? configuration.selectedTab)
		return Timeline(entries: [entry], policy: .atEnd)
	}
}

struct WBAppEntry: TimelineEntry {
	let date: Date
	let selectedTab: Shared.TabLabels
}

struct WBAppWidgetEntryView : View {
	var entry: Provider.Entry
	
	var index: Int {
		Shared.TabLabels.allCases.firstIndex(of: entry.selectedTab) ?? 0
	}
	
	var body: some View {
		VStack(spacing: 15) {
			Text("Открыть вкладку")
				.font(.bodyText1())
				.foregroundStyle(.neutralActive)
			Text("\(entry.selectedTab.name)")
				.font(.heading2())
				.foregroundStyle(.neutralActive)
			HStack {
				Button(intent: ConfigurationAppIntent(selectedTab: getTabByIndex(index-1))) {
					Image(systemName: "chevron.left")
						.foregroundStyle(.brandDefault)
				}
				
				Button(intent: ConfigurationAppIntent(selectedTab: getTabByIndex(index+1))) {
					Image(systemName: "chevron.right")
						.foregroundStyle(.brandDefault)
				}
			}
		}
		.widgetURL(URL(string: "wbapp://\(entry.selectedTab.rawValue)"))
	}
	
	private func getTabByIndex(_ index: Int) -> Shared.TabLabels {
		Shared.shared.getTabByIndex(index)
	}
}

struct WBAppWidget: Widget {
	let kind: String = "WBAppWidget"
	
	var body: some WidgetConfiguration {
		AppIntentConfiguration(
			kind: kind,
			intent: ConfigurationAppIntent.self,
			provider: Provider()
		) { entry in
			WBAppWidgetEntryView(entry: entry)
				.containerBackground(.fill.tertiary, for: .widget)
		}
		.configurationDisplayName("Tab Widget")
		.description("Switch tabs.")
		.supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
	}
}

#Preview(as: .systemSmall) {
	WBAppWidget()
} timeline: {
	WBAppEntry(date: .now, selectedTab: .chats)
}
