import Combine
import AppKit

class ViewModel:ObservableObject {
    @Published var leftFilePreview:(NSImage, String)? = nil
    @Published var leftFilePath:String = ""
    @Published var leftFileChecksum:String = ""
    
    @Published var rightFilePreview:(NSImage, String)? = nil
    @Published var rightFilePath:String = ""
    @Published var rightFileChecksum:String = ""
    
    var isSameChecksum:Bool {
        return true
    }
    
    @Published var isAlertPresented:Bool = false {
        didSet {
            print(oldValue)
        }
    }
    var alertMessage:String = ""
    
    static func isFile(urls:[URL]) -> NSDragOperation {
        guard urls.count == 1 else {
            return NSDragOperation()
        }
                                
        guard urls.first!.isFileURL else {
            return NSDragOperation()
        }
        
        guard !urls.first!.isDirectory else {
            return NSDragOperation()
        }
        
        return .copy
    }
}

