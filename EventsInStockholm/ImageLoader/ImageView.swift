//
//  ImageView.swift
//  EventsInStockholm
//
//  Created by Aleksandr Meshchenko on 14.02.21.
//

import Combine
import SwiftUI

struct ImageView: View {
    @ObservedObject var imageLoader:ImageLoader
    @State var image:UIImage = UIImage()
    
    init(withURL url:String) {
        imageLoader = ImageLoader(urlString:url)
    }
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(UIImage(named: "default_backdrop")!.size, contentMode: .fill)
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }.onReceive(imageLoader.dataPublisher) { data in
            self.image = UIImage(data: data) ?? UIImage()
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(withURL: "")
    }
}
