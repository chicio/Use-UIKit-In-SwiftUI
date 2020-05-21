//
//  DocumentNameLabel.swift
//  Use-UIKit-In-SwiftUI
//
//  Created by Fabrizio Duroni on 20.05.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import SwiftUI

struct DocumentNameLabel: UIViewRepresentable {
    @Binding var content: String
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.layer.borderColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        label.layer.borderWidth = 2
        return label
    }

    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = content
    }
}
