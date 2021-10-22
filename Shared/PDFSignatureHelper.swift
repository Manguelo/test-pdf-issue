//
//  PDFSignatureHelper.swift
//  Test-pdf-issue (iOS)
//
//  Created by Matthew Anguelo on 10/21/21.
//

import Foundation
import UIKit
import PDFKit

class PDFHelper {
    func signPDF(path: String, signatureImage: UIImage, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, pageIndex: Int) {
        if  let pdf = CGPDFDocument(NSURL(fileURLWithPath: path)) {
            let pageCount = pdf.numberOfPages
            
            // Write to file
            UIGraphicsBeginPDFContextToFile(path, CGRect.zero, nil)
            for index in 1...pageCount {
                let page =  pdf.page(at: index)
                let pageFrame = page?.getBoxRect(.mediaBox)
                
                
                UIGraphicsBeginPDFPageWithInfo(pageFrame!, nil)
                
                let pdfContext = UIGraphicsGetCurrentContext()
                
                
                // Draw existing page
                pdfContext?.saveGState()
                
                pdfContext?.scaleBy(x: 1, y: -1)
                pdfContext?.translateBy(x: 0, y: -pageFrame!.size.height)
                pdfContext?.drawPDFPage(page!)
                pdfContext?.restoreGState()
                
                // Draw image on top of page
                if (index == (pageIndex + 1)) {
                    signatureImage.draw(in: CGRect(x: x, y: y, width: width, height: height))
                }
            }
            UIGraphicsEndPDFContext()
        }
    }
}
