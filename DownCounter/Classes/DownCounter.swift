//
//  DownCounter.swift
//  Pods
//
//  Created by holin on 6/26/16.
//
//

import Foundation

@objc public protocol DownCounterDelegate {
  func update(count: Double)
  func finished()
}

@objc public class DownCounter: NSObject {
  
  public var delegate: DownCounterDelegate?
  public var finished = false

  var count, endAt, step, startAt, interval: Double
  var timer: NSTimer?
  
  public init(count: Double,
              endAt: Double = 0.0,
              interval: Double = 1.0,
              step: Double = 1.0) {
    self.count = count
    self.interval = interval
    self.startAt = count
    self.endAt = endAt
    self.step = step
  }
  
  public func start() {
    self.count = self.startAt
    self.finished = false
    self.timer = NSTimer.scheduledTimerWithTimeInterval(self.interval, target: self, selector: "update", userInfo: nil, repeats: true)
  }
  
  @objc public func update() {
    if(self.count > self.endAt) {
      self.count -= self.step
      if (self.delegate != nil) {
        self.delegate?.update(self.count)
      }
    } else {
      self.timer!.invalidate()
      self.finished = true
      if (self.delegate != nil) {
        self.delegate?.finished()
      }
    }
  }
}
