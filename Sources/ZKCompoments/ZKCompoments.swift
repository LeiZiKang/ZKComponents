// The Swift Programming Language
// https://docs.swift.org/swift-book

import UIKit

/// 复制到剪切板
public func copyToClipboard(text: String, completion: @escaping() -> Void) {
    UIPasteboard.general.string = text
    completion()
}
