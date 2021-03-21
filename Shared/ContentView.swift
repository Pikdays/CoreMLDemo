//
//  ContentView.swift
//  Shared
//
//  Created by Pikdays on 2021/3/21.
//

import SwiftUI

struct ContentView: View {
    @State private var image: UIImage?
    @State private var text: String?
    
    @State private var isShowImagePicker = false
    
    var body: some View {
        VStack {
            Image(uiImage: (image ?? UIImage(systemName: "photo"))!)
                .resizable()
                .frame(width: 200, height: 200)
                .onTapGesture(perform: {
                    isShowImagePicker = true
                })
            
            Text(text ?? "Hello, world!")
        }
        .padding()
        .sheet(isPresented: $isShowImagePicker, onDismiss: {
            text = image?.analyzeImage()
        }, content: {
            ImagePicker(image: $image)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
