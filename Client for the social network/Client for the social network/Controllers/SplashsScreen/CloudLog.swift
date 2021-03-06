import UIKit

public class CloudLog : NSObject {

    //// Drawing Methods

    @objc dynamic public class func drawCloud(frame targetFrame: CGRect = CGRect(x: 0, y: 0, width: 781, height: 440), resizing: ResizingBehavior = .aspectFit) {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()!
        
        //// Resize to Target Frame
        context.saveGState()
        let resizedFrame: CGRect = resizing.apply(rect: CGRect(x: 0, y: 0, width: 781, height: 440), target: targetFrame)
        context.translateBy(x: resizedFrame.minX, y: resizedFrame.minY)
        context.scaleBy(x: resizedFrame.width / 781, y: resizedFrame.height / 440)



        //// Image Declarations
        let _1631906037_4papikpropmalenkoeoblachkorisunok4 = UIImage(named: "_1631906037_4papikpropmalenkoeoblachkorisunok4.png")!

        //// cloudLogo Drawing
        let cloudLogoPath = UIBezierPath(rect: CGRect(x: -65, y: -375, width: 846, height: 815))
        context.saveGState()
        cloudLogoPath.addClip()
        context.translateBy(x: -65, y: -375)
        context.scaleBy(x: 1, y: -1)
        context.translateBy(x: 0, y: -_1631906037_4papikpropmalenkoeoblachkorisunok4.size.height)
        context.draw(_1631906037_4papikpropmalenkoeoblachkorisunok4.cgImage!, in: CGRect(x: 0, y: 0, width: _1631906037_4papikpropmalenkoeoblachkorisunok4.size.width, height: _1631906037_4papikpropmalenkoeoblachkorisunok4.size.height))
        context.restoreGState()
        
        context.restoreGState()

    }




    @objc(CloudLogResizingBehavior)
    public enum ResizingBehavior: Int {
        case aspectFit /// The content is proportionally resized to fit into the target rectangle.
        case aspectFill /// The content is proportionally resized to completely fill the target rectangle.
        case stretch /// The content is stretched to match the entire target rectangle.
        case center /// The content is centered in the target rectangle, but it is NOT resized.

        public func apply(rect: CGRect, target: CGRect) -> CGRect {
            if rect == target || target == CGRect.zero {
                return rect
            }

            var scales = CGSize.zero
            scales.width = abs(target.width / rect.width)
            scales.height = abs(target.height / rect.height)

            switch self {
                case .aspectFit:
                    scales.width = min(scales.width, scales.height)
                    scales.height = scales.width
                case .aspectFill:
                    scales.width = max(scales.width, scales.height)
                    scales.height = scales.width
                case .stretch:
                    break
                case .center:
                    scales.width = 1
                    scales.height = 1
            }

            var result = rect.standardized
            result.size.width *= scales.width
            result.size.height *= scales.height
            result.origin.x = target.minX + (target.width - result.width) / 2
            result.origin.y = target.minY + (target.height - result.height) / 2
            return result
        }
    }
}
