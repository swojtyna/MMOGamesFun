import Foundation

public extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }

    subscript (safe index: Index, default defaultValue: @autoclosure () -> Element) -> Element {
        return indices.contains(index) ? self[index] : defaultValue()
    }
}
