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
    @State var buttonEnabled: Bool = true
    @State var documentUrl: String = ""
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Url: ", text: $documentUrl)
                .font(.system(size: 20))
            DocumentSelectionButton(enabled: self.$buttonEnabled, action: {
                self.isDocumentPickerPresented = true
            })
                .frame(height: 40, alignment: .center)
                .sheet(isPresented: self.$isDocumentPickerPresented, content: {
                    DocumentPickerViewController { url in
                        self.documentUrl = url.lastPathComponent
                        self.buttonEnabled = false
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
