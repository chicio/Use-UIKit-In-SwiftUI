//
//  DocumentPickerViewController.swift
//  Use-UIKit-In-SwiftUI
//
//  Created by Fabrizio Duroni on 20.05.20.
//  Copyright © 2020 Fabrizio Duroni. All rights reserved.
//

import SwiftUI
import MobileCoreServices

struct DocumentPickerViewController: UIViewControllerRepresentable {
    var callback: (URL) -> ()
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(documentController: self)
    }
    
    func updateUIViewController(_ uiViewController: UIDocumentPickerViewController,
                                context: UIViewControllerRepresentableContext<DocumentPickerViewController>) {
    }

    func makeUIViewController(context: Context) -> UIDocumentPickerViewController {
        let controller = UIDocumentPickerViewController(documentTypes: [String(kUTTypeText)], in: .open)
        controller.delegate = context.coordinator
        return controller
    }

    class Coordinator: NSObject, UIDocumentPickerDelegate {
        var documentController: DocumentPickerViewController

        init(documentController: DocumentPickerViewController) {
            self.documentController = documentController
        }

        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            guard let url = urls.first, url.startAccessingSecurityScopedResource() else { return }
            defer { url.stopAccessingSecurityScopedResource() }
            documentController.callback(urls[0])
        }
    }
}
