//
//  PDFKitView.swift
//  Test-pdf-issue (iOS)
//
//  Created by Matthew Anguelo on 10/21/21.
//

import SwiftUI
import PDFKit

struct PDFKitRepresentedView: UIViewRepresentable {
    var url: URL
    var imageName: String

    init(_ url: URL, imageName: String) {
        self.url = url
        self.imageName = imageName
    }

    func makeUIView(context: UIViewRepresentableContext<PDFKitRepresentedView>) -> PDFKitRepresentedView.UIViewType {
        // Create a `PDFView` and set its `PDFDocument`.
        let pdfView = PDFView()
        pdfView.document = PDFDocument(url: self.url)
        pdfView.maxScaleFactor = 0.4
        return pdfView
    }

    func updateUIView(_ pdfView: PDFView, context: UIViewRepresentableContext<PDFKitRepresentedView>) {
        pdfView.document = PDFDocument(url: self.url)
        pdfView.maxScaleFactor = 0.4
    }
}

struct PDFKitView: View {
    var path: String
    var imageName: String

    var body: some View {
        PDFKitRepresentedView(URL(fileURLWithPath: path), imageName: imageName)
    }
}
