//
//  ContentView.swift
//  Shared
//
//  Created by Matthew Anguelo on 10/21/21.
//

import SwiftUI
import PDFKit

struct ContentView: View {
    @State var lastImageAdded: String = ""
    @State var pdfPath: String = (Bundle.main.url(forResource: "dummy", withExtension: "pdf"))!.path
    
    var body: some View {
        PDFKitView(path:  pdfPath, imageName: lastImageAdded)
        Button(action: {
            PDFHelper().signPDF(path: pdfPath, signatureImage: UIImage(named: "signature1")!, x: 100, y: 100, width: 500, height: 200, pageIndex: 0)
            lastImageAdded = "1"
        }) {
            Text("Add Image 1")
        }.padding(.top, 10)
        Button(action: {
            PDFHelper().signPDF(path: pdfPath, signatureImage: UIImage(named: "signature2")!, x: 100, y: 300, width: 500, height: 200, pageIndex: 0)
            lastImageAdded = "2"
        }) {
            Text("Add Image 2")
        }.padding(.top, 10)
        Button(action: {
            PDFHelper().signPDF(path: pdfPath, signatureImage: UIImage(named: "signature3")!, x: 100, y: 600, width: 500, height: 200, pageIndex: 0)
            lastImageAdded = "3"
        }) {
            Text("Add Image 3")
        }.padding(.top, 10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
