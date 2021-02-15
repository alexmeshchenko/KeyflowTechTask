//
//  EventListView.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import SwiftUI
import Networking

struct EventListView: View {
    @State var showModal: Bool = false
    @ObservedObject var eventViewModel: EventViewModel
    
    var body: some View {
        List {
            buttonShowModal
            ForEach(eventViewModel.events) { event in
                EventCellView(item: event)
                    .clipped()
                    .cornerRadius(4)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            }
            if eventViewModel.isPageLoading {
                progressView
            }
        }
        .onAppear() {
            eventViewModel.loadPage()
        }
    }
    
    var buttonShowModal: some View {
        LargeButton(title: "GO OUT TONIGHT",
                    backgroundColor: Color.black) {
            showModal = true
        }.sheet(isPresented: $showModal) {
            VStack {
                Text("GO OUT TONIGHT")
                Text("🍹")
                    .font(Font.system(size: 200))
            }
        }
    }
    
    var progressView: some View {
        return
            VStack (alignment: .center) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
            .frame(maxWidth: .infinity)
    }
    
}
