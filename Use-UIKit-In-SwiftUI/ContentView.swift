//
//  ContentView.swift
//  Use-UIKit-In-SwiftUI
//
//  Created by Fabrizio Duroni on 20.05.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isDocumentPickerPresented: Bool = false
    @State var documentUrl: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            DocumentNameLabel(content: self.$documentUrl)
                .frame(height: 40)
            Button(action: {
                self.isDocumentPickerPresented.toggle()
            }, label: { Text("Document selection") })
                .frame(height: 40, alignment: .center)
                .sheet(isPresented: self.$isDocumentPickerPresented, content: {
                    DocumentPickerViewController { url in
                        self.documentUrl = url.lastPathComponent
                    }
                })
            Spacer()
        }
        .padding(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
