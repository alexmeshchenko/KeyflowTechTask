//
//  RootView.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import SwiftUI
import Networking

struct RootView: View {
    @State var showModal: Bool = false
    @State var showMail: Bool = false
    @ObservedObject var eventViewModel = EventViewModel.shared
    
    var body: some View {
        
        GeometryReader{
            geometry in
            NavigationView {
                
                ViewToRefresh(width: geometry.size.width, height: geometry.size.height, handlePullToRefresh: {
                    eventViewModel.reloadPage()
                })
                {
                    EventListView(eventViewModel: eventViewModel)
                }
                
                .navigationBarTitle(Text("Stockholm"), displayMode: .inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        buttonShowModal
                    }
                }
                .toolbar {
                    buttonShowMail
                }
            }//NavigationView
        }// GeometryReader{
    }
    
    
    var buttonShowMail: some View {
        Button("📩", action: {
            showMail = true
        }).sheet(isPresented: $showMail) {
            VStack {
                Text("📩")
                    .font(Font.system(size: 200))
            }
        }
    }
    var buttonShowModal: some View {
        Button(action: {
            showModal = true
        }) {
            Text("🌐")
        }.sheet(isPresented: $showModal) {
            VStack {
                Text("🌐")
                    .font(Font.system(size: 200))
            }
        }
    }
}

