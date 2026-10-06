import Foundation
import CoreGraphics
import ImageIO
import UniformTypeIdentifiers
// args: pdf out scale x0 y0 x1 y1  (coords in 2x-render pixel space, top-left origin)
let a = CommandLine.arguments
let doc = CGPDFDocument(URL(fileURLWithPath: a[1]) as CFURL)!, page = doc.page(at: 1)!
let box = page.getBoxRect(.mediaBox)
let s = CGFloat(Double(a[3])!)
let x0 = CGFloat(Double(a[4])!)/2, y0 = CGFloat(Double(a[5])!)/2, x1 = CGFloat(Double(a[6])!)/2, y1 = CGFloat(Double(a[7])!)/2
let w = Int((x1-x0)*s), h = Int((y1-y0)*s)
let ctx = CGContext(data: nil, width: w, height: h, bitsPerComponent: 8, bytesPerRow: 0, space: CGColorSpaceCreateDeviceRGB(), bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!
ctx.setFillColor(CGColor(red:1,green:1,blue:1,alpha:1)); ctx.fill(CGRect(x:0,y:0,width:w,height:h))
ctx.scaleBy(x: s, y: s)
// pdf y up; region top y0 in top-left coords -> pdf y = box.height - y1
ctx.translateBy(x: -x0 - box.origin.x, y: -(box.height - y1) - box.origin.y)
ctx.drawPDFPage(page)
let dest = CGImageDestinationCreateWithURL(URL(fileURLWithPath: a[2]) as CFURL, UTType.png.identifier as CFString, 1, nil)!
CGImageDestinationAddImage(dest, ctx.makeImage()!, nil); CGImageDestinationFinalize(dest)
print(a[2], w, h)
