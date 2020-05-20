//
//  File.swift
//  Use-UIKit-In-SwiftUI
//
//  Created by Fabrizio Duroni on 20.05.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import SwiftUI

@objc class DocumentSelectionButtonAction: NSObject {
    private var action: (() -> Void)?
        
    func set(action: @escaping () -> Void) {
        self.action = action
    }

    @objc func doAction() {
        self.action?()
    }
}

struct DocumentSelectionButton: UIViewRepresentable {
    @Binding var enabled: Bool
    var action: () -> Void
    private let documentSelectionButtonAction: DocumentSelectionButtonAction = DocumentSelectionButtonAction()
    
    func makeUIView(context: Context) -> UIButton {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        button.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        button.layer.borderWidth = 2
        button.setTitle("Document selected", for: .normal)
        button.addTarget(self.documentSelectionButtonAction, action: #selector(DocumentSelectionButtonAction.doAction), for: .touchUpInside)
        documentSelectionButtonAction.set(action: action)

        return button
    }

    func updateUIView(_ uiView: UIButton, context: Context) {
        uiView.isEnabled = enabled
    }
}
