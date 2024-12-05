import AppKit

extension NSImage {
    func resize(to newSize: NSSize) -> NSImage {
        let newImage = NSImage(size: newSize)
        
        newImage.lockFocus()
        self.draw(
            in: NSRect(origin: .zero, size: newSize),
            from: NSRect(origin: .zero, size: self.size),
            operation: .sourceOver, fraction: 1.0
        )
        newImage.unlockFocus()
        
        return newImage
    }
}
