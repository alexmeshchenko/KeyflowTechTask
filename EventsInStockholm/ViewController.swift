//
//  ViewController.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 13.02.21.
//

import UIKit
import SwiftUI

class ChildHostingCoontroller: UIHostingController<RootView> {
    required init?(coder: NSCoder) {
        super.init(coder: coder, rootView: RootView())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

