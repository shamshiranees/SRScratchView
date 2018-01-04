//
//  SRSrcatchView.swift
//  Pods-SRScratchView_Example
//
//  Created by Shamshir on 04/01/18.
//

import UIKit


@objc
public protocol SRScratchViewDelegate: class {
    
    func scratchCardEraseProgress(eraseProgress: Float)
}


public class SRScratchView:UIImageView {
    
    
    public weak var delegate: SRScratchViewDelegate?
    
    private var finalLocation: CGPoint?
    
    public lazy var lineType: CGLineCap = .round
    public lazy var lineWidth: CGFloat = 30.0
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        
        isUserInteractionEnabled = true
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard  let touch = touches.first else {
            
            return
        }
        
        finalLocation = touch.location(in: self)
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard  let touch = touches.first, let point = finalLocation else {
            
            return
        }
        
        let currentLocation = touch.location(in: self)
        scrachBetween(fromPoint: point, currentPoint: currentLocation)
        
        finalLocation = currentLocation
        
        
        if let img = self.image, let _ = delegate {
            let eraseProgress = scratchedPercentage(scratchImage: img)
            delegate?.scratchCardEraseProgress(eraseProgress: eraseProgress*100)
        }
    }
    
    func scrachBetween(fromPoint: CGPoint, currentPoint: CGPoint) {
        
        UIGraphicsBeginImageContext(self.frame.size)
        
        image?.draw(in: self.bounds)
        
        let path = CGMutablePath()
        path.move(to: fromPoint)
        path.addLine(to: currentPoint)
        
        let context = UIGraphicsGetCurrentContext()!
        context.setShouldAntialias(true)
        context.setLineCap(lineType)
        context.setLineWidth(lineWidth)
        context.setBlendMode(.clear)
        context.addPath(path)
        
        context.strokePath()
        
        image = UIGraphicsGetImageFromCurrentImageContext()
        
        
        UIGraphicsEndImageContext()
    }
    
    
    
    private func scratchedPercentage(scratchImage: UIImage) -> Float {
        
        let width = Int(scratchImage.size.width)
        let height = Int(scratchImage.size.height)
        
        let bitmapBytesPerRow = width
        let bitmapByteCount = bitmapBytesPerRow * height
        
        let pixelData = UnsafeMutablePointer<UInt8>.allocate(capacity: bitmapByteCount)
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        
        let context = CGContext(data: pixelData,
                                width: width,
                                height: height,
                                bitsPerComponent: 8,
                                bytesPerRow: bitmapBytesPerRow,
                                space: colorSpace,
                                bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.alphaOnly.rawValue).rawValue)!
        
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        context.clear(rect)
        context.draw(scratchImage.cgImage!, in: rect)
        
        var alphaOnlyPixels = 0
        
        for x in 0...Int(width) {
            for y in 0...Int(height) {
                
                if pixelData[y * width + x] == 0 {
                    alphaOnlyPixels += 1
                }
            }
        }
        
        free(pixelData)
        
        return Float(alphaOnlyPixels) / Float(bitmapByteCount)
    }
}

