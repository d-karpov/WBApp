//
//  CustomSearchBarView.swift
//  WBApp
//
//  Created by Денис Карпов on 04.07.2024.
//

import SwiftUI

struct CustomSearchBarView: View {
	@Binding var searchText: String
	
	var body: some View {
		HStack(spacing: 8) {
			Image(.search)
				.resizable()
				.renderingMode(/*@START_MENU_TOKEN@*/.template/*@END_MENU_TOKEN@*/)
				.frame(width: 16, height: 16)
				.foregroundStyle(searchText == "" ? .neutralDisabled : .neutralActive)
			TextField("Search", text: $searchText)
				.font(.bodyText1())
				.frame(maxHeight: 24)
				.foregroundStyle(.neutralActive)
		}
		.padding(.horizontal, 8)
		.padding(.vertical, 6)
		.background(.neutralSecondaryBG)
		.clipShape(.rect(cornerRadius: 4))
	}
}

#Preview {
	@State var searchText: String = ""
	return CustomSearchBarView(searchText: $searchText)
}
