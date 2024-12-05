import SwiftUI

@main
struct FileHashComparatorApp: App {
    @State var viewModel:ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            HStack {
                FileChecksum(
                    heading: "Left File",
                    path: viewModel.leftFilePath,
                    checksum: " ",
                    dropping: {_ in},
                    selecting: {}
                )
                .padding(
                    EdgeInsets(
                        top: 20,
                        leading: 20,
                        bottom: 20,
                        trailing: 10
                    )
                )
                
                LabelIcon(
                    text: "Checksums\nare not equal",
                    iconSystemName: "multiply",
                    color: .red
                )
                
                FileChecksum(
                    heading: "Right File",
                    path: "",
                    checksum: "",
                    dropping: {_ in},
                    selecting: {}
                )
                .padding(
                    EdgeInsets(
                        top: 20,
                        leading: 10,
                        bottom: 20,
                        trailing: 20
                    )
                )
            }
            .frame(
                minWidth: 700,
                maxWidth: 700,
                minHeight: 530,
                maxHeight: 530
            )
        }
        .windowResizability(.contentSize)
    }
}
