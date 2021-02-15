//
//  ViewToRefresh.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import SwiftUI

struct ViewToRefresh<T>: UIViewRepresentable where T: View {
    
    var width : CGFloat, height : CGFloat
    let handlePullToRefresh: () -> Void
    let listView: () -> T
    
    func makeCoordinator() -> Coordinator<T> {
        Coordinator(self, listView: listView, handlePullToRefresh: handlePullToRefresh)
    }

    func makeUIView(context: Context) -> UIScrollView {
        let control = UIScrollView()
        control.refreshControl = UIRefreshControl()
        control.refreshControl?.addTarget(context.coordinator, action:
            #selector(Coordinator.handleRefreshControl),
                                          for: .valueChanged)

        let childView = UIHostingController(rootView: listView() )
        childView.view.frame = CGRect(x: 0, y: 0, width: width, height: height)
        
        control.addSubview(childView.view)
        return control
    }

    func updateUIView(_ uiView: UIScrollView, context: Context) {}

    class Coordinator<T>: NSObject where T: View {
        var control: ViewToRefresh
        var handlePullToRefresh: () -> Void
        var listView: () -> T

        init(_ control: ViewToRefresh, listView: @escaping () -> T, handlePullToRefresh: @escaping () -> Void) {
            self.control = control
            self.handlePullToRefresh = handlePullToRefresh
            self.listView = listView
        }

        @objc func handleRefreshControl(sender: UIRefreshControl) {

            sender.endRefreshing()
            handlePullToRefresh()
           
        }
    }
}

