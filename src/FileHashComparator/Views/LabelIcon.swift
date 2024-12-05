import SwiftUI

struct LabelIcon: View {
    let text:String
    let iconSystemName:String
    let color:Color
    
    var body: some View {
        VStack(
            alignment: .center,
            spacing: 7
        ){
            Image(systemName: iconSystemName)
                .font(.largeTitle)
                .foregroundColor(color)
            
            Text(text)
                .multilineTextAlignment(.center)
        }
    }
}
