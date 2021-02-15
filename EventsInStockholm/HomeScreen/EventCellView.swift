//
//  EventCellView.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import SwiftUI
import Networking
import Combine

struct EventCellView: View {
    
    @ObservedObject var eventViewModel = EventViewModel.shared
    
    let item: EventPartialResponseSchema
    var body: some View {
        return ZStack(alignment: .leading) {

            ImageView(withURL: "https://res.cloudinary.com/keyflow/image/upload/" + (item.images?[0] ?? ""))

            infoView
                .background(Color.white)
                .padding([.leading], 20)

            }//ZStack
    }
    
    var infoView: some View {
        return
            HStack {
                Spacer(minLength: 10)
                VStack(alignment: .leading) {
                    Spacer()
                    Text(item.name.asStringOrEmpty)
                        .font(.headline)
                        .foregroundColor(.primary)
                    if let venueId = item.venueId,
                       let result = eventViewModel.venues.first(where: { $0.venueId == venueId }) {
                        Spacer()
                        Text(result.venueName)
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                }// VStack

                Spacer(minLength: 10)
                VStack(alignment: .center) {
                    Text(item.startTime?.getWeekDay()?.capitalized ?? "")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    Text(item.startTime?.getDay() ?? "")
                        .font(.headline)
                        .foregroundColor(.primary)
                    
                    Text(item.startTime?.getMonth() ?? "")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                    
                    if let startTime = item.startTime?.getTime(),
                       let endTime = item.endTime?.getTime() {
                        Text("\(startTime) - \(endTime)")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                }// VStack
                Spacer(minLength: 10)
            }// HStack

    }
    
}

