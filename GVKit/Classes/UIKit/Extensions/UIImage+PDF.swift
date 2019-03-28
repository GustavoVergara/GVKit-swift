//
// UIImage+PDF.swift. Copyright © 2016 Nigel Timothy Barber (@mindbrix). All rights reserved.
//
// Edited by Gustavo Vergara (GustavoVergara @ GitHub)
//
import UIKit

extension UIImage {
    
    convenience init?(pdfURL: URL, pageNumber: Int, width: CGFloat) {
        self.init(pdfURL: pdfURL, pageNumber: pageNumber, constraints: CGSize(width: width, height: 0))
    }
    
    convenience init?(pdfURL: URL, pageNumber: Int, height: CGFloat) {
        self.init(pdfURL: pdfURL, pageNumber: pageNumber, constraints: CGSize(width: 0, height: height))
    }
    
    convenience init?(pdfURL: URL, pageNumber: Int) {
        self.init(pdfURL: pdfURL, pageNumber: pageNumber, constraints: .zero)
    }
    
    convenience init?(pdfURL: URL, pageNumber: Int, constraints: CGSize) {
        guard let pdf = CGPDFDocument(pdfURL as CFURL) else { return nil }
        guard let page = pdf.page(at: pageNumber) else { return nil }
        
        let size = page.getBoxRect(.mediaBox).size.forConstraints(constraints)
        let cacheURL = pdfURL.PDFCacheURL(pageNumber, size: size)
        
        if let url = cacheURL, let image = UIImage(contentsOfFile: url.path) {
            self.init(cgImage: image.cgImage!, scale: UIScreen.main.scale, orientation: .up)
            return
        }
        
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        defer { UIGraphicsEndImageContext() }
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        
        context.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height))
        let rect = page.getBoxRect(.mediaBox)
        context.translateBy(x: -rect.origin.x, y: -rect.origin.y)
        context.scaleBy(x: size.width / rect.size.width, y: size.height / rect.size.height)
        context.drawPDFPage(page)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        if let image = image {
            if let url = cacheURL, let imageData = image.pngData() {
                try? imageData.write(to: url, options: [])
            }
            self.init(cgImage: image.cgImage!, scale: UIScreen.main.scale, orientation: .up)
        }
        
        return nil
    }
    
//    static func PDFImageSizeWith(_ url: URL, pageNumber: Int, width: CGFloat) -> CGSize {
//        guard let pdf = CGPDFDocument(url as CFURL), let page = pdf.page(at: pageNumber) else {
//            return .zero
//        }
//
//        return page.getBoxRect(.mediaBox).size.forConstraints(CGSize(width: width, height: 0))
//    }
}

fileprivate extension CGSize {
    func forConstraints(_ constraints: CGSize) -> CGSize {
        if constraints.width == 0 && constraints.height == 0 {
            return self
        }
        let sx = constraints.width / width, sy = constraints.height / height
        let s = sx != 0 && sy != 0 ? min(sx, sy) : max(sx, sy)
        return CGSize(width: ceil(width * s), height: ceil(height * s))
    }
}

fileprivate extension URL {
    func PDFCacheURL(_ pageNumber: Int, size: CGSize) -> URL? {
        guard let attributes = try? FileManager.default.attributesOfItem(atPath: self.path) else { return nil }
        guard let fileSize = attributes[.size] as? NSNumber                                 else { return nil }
        guard let fileDate = attributes[.modificationDate] as? Date                         else { return nil }
        
        let hashables = self.path + fileSize.stringValue + String(fileDate.timeIntervalSince1970) + String(describing: size) + String(pageNumber)
    
        let cacheDirectory = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] + "/__PDF_CACHE__"
        try? FileManager.default.createDirectory(atPath: cacheDirectory, withIntermediateDirectories: true, attributes:nil)
    
        return URL(fileURLWithPath: cacheDirectory + "/" + String(format:"%2X", hashables.hash) + ".png")
    }
}
