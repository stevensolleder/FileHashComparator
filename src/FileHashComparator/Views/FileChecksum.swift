import SwiftUI
import DSFDropFilesView

typealias FileDropdown = DSFDropFilesView.SwiftUI
typealias FileDropdownStyle = DSFDropFilesView.SwiftUI.DisplayProperties

struct FileChecksum:View {
    internal var heading:String
    @State internal var preview:(NSImage, String)? = nil
    @State internal var path:String
    @State internal var checksum:String
    internal var dropping:((String) -> Void)
    internal var selecting:(() -> Void)
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(heading)
                .font(.title3)
            
            Divider()
            
            FileDropdown(
                displayProperties: FileDropdownStyle(
                    isBordered: true,
                    isAnimated: false,
                    lineWidth: 1,
                    cornerRadius: 5
                ),
                isEnabled: true,
                allowsMultipleDrop: true,
                icon: preview?.0 ?? nil,
                iconLabel: preview?.1 ?? "Drop File",
                selectFilesLabel: preview == nil ? "Select File" : "",
                selectFilesButtonIsLink: true,
                validateFiles: {_ in .copy},
                dropFiles: {
                    (urls:Array<URL>) in
                    dropping(urls.first!.relativePath)
                    return true
                },
                selectFiles: selecting
            )
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Path")
                TextEditor(text: $path)
                    .onChange(of: path) { value in
                        if value.contains("\n") {
                            path = value.replacingOccurrences(of: "\n", with: "")
                            //self.dismissKeyboard()
                            //self.onEditingEnded()
                        }
                    }
                //TextField("", text: $path, axis: .vertical)
                //    .lineLimit(4, reservesSpace: true)
                //    .cornerRadius(7)
            }
            
            VStack(alignment: .leading, spacing: 3) {
                Text("Checksum (SHA-256)")
                Text(checksum)
                    .lineLimit(4, reservesSpace: true)
                    .textSelection(.enabled)
                    .frame(maxWidth: .infinity, minHeight: 80)
                    .padding(7)
                    .background(
                        RoundedRectangle(cornerRadius: 3)
                            .stroke(.gray, lineWidth: 0.3)
                            .fill(Color(NSColor(calibratedWhite: 0, alpha: 0.05)))
                    )
            }
        }
    }
}
