//
//  EventViewModel.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import Foundation
import Networking

extension EventPartialResponseSchema: Identifiable {
    public var index: Int? {
        self.id
    }
}

final class EventViewModel: ObservableObject {
    
    static let shared = EventViewModel()
    
    @Published private(set) var events: [EventPartialResponseSchema] = [EventPartialResponseSchema]()
    @Published private(set) var venues: [VenuePartialResponseSchema] = [VenuePartialResponseSchema]()
    @Published private(set) var page: Int = 0
    @Published private(set) var isPageLoading: Bool = false
    
    
    init() {}
    
    func reloadPage() {
        page = 0
        loadPage()
    }
        
    func loadPage() {
        guard isPageLoading == false else {
            return
        }
        isPageLoading = true
        page += 1
        EventsAPI.getEventsbylocation(long: 59.33539270000001,
                                      lat: 18.07379500000002,
                                      placeId: "ChIJywtkGTF2X0YRZnedZ9MnDag",
                                      locationRadius: 20,
                                      pageNumber: page, pageSize: 50) { [weak self] (response, error) in
            if let page = self?.page, page <= 1 {
                self?.events.removeAll()
                self?.venues.removeAll()
            }
            if let results = response?.data.events {
                self?.events.append(contentsOf: results)
            }
            if let venues = response?.data.venues {
                self?.venues.append(contentsOf: venues)
            }
            self?.isPageLoading = false
        }
    }
}
