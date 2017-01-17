//
//  DealWithItGlasses.swift
//  DealWithIt
//
//  Created by Eric Cerney on 1/16/17.
//  Copyright © 2017 Eric Cerney. All rights reserved.
//

import UIKit

public class DealWithItGlasses: UIView {
  public enum PixelColor: Int {
    case clear = 0, black, gray

    var cgColor: CGColor {
      switch self {
      case .clear: return UIColor.clear.cgColor
      case .black: return UIColor.black.cgColor
      case .gray: return UIColor.gray.cgColor
      }
    }
  }

  public static let pixels = [
    [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    [1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1],
    [0, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 0],
    [0, 0, 1, 1, 2, 1, 2, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 2, 1, 2, 1, 1, 1, 1, 0, 0],
    [0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0]
  ]

  public static var numPixelsHeight: Int {
    return pixels.count
  }

  public static var numPixelsWidth: Int {
    return pixels.first?.count ?? 0
  }

  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  public init(origin: CGPoint, width: CGFloat) {
    let height = width * CGFloat(DealWithItGlasses.numPixelsHeight) / CGFloat(DealWithItGlasses.numPixelsWidth)
    super.init(frame: CGRect(x: origin.x, y: origin.y, width: width, height: height))
    backgroundColor = .clear
  }

  override public convenience init(frame: CGRect) {
    self.init(origin: frame.origin, width: frame.width)
  }

  public convenience init(width: CGFloat) {
    self.init(origin: .zero, width: width)
  }

  override public func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { return }

    let pixelWidth = rect.width / CGFloat(DealWithItGlasses.numPixelsWidth)

    let xOffset: CGFloat = floor((rect.width - pixelWidth * CGFloat(DealWithItGlasses.numPixelsWidth)) / 2.0)
    let yOffset: CGFloat = floor((rect.height - pixelWidth * CGFloat(DealWithItGlasses.numPixelsHeight)) / 2.0)

    for (y, pixelRow) in DealWithItGlasses.pixels.enumerated() {
      for (x, pixel) in pixelRow.enumerated() {
        if let pixelColor = PixelColor(rawValue: pixel) {
          context.setFillColor(pixelColor.cgColor)
          let test = CGRect(x: CGFloat(x)*pixelWidth + xOffset, y: CGFloat(y)*pixelWidth + yOffset, width: pixelWidth + 0.5, height: pixelWidth + 0.5)
          context.addRect(test)
          context.fillPath()
        }
      }
    }
  }
}
