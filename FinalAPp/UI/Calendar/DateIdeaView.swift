import SwiftUI
struct DateIdea : View {
    var title: String
    var desc: String
    var type: DateType
    
    var body: some View {
        let color: Color = switch type {
        case .Food:
                .red
        case .Game:
                .green
        case .Activity:
                .yellow
        }
        
        HStack {
            Rectangle()
                .foregroundStyle(color.opacity(0.4)).overlay {
                    Image(systemName: type.rawValue).foregroundStyle(color.opacity(0.9))
            }
            Spacer(minLength: 30)
            VStack {
                Text(title).bold()
                Text(desc).foregroundStyle(.gray)
            }
        }.fixedSize().padding([.leading, .trailing]).background {
            RoundedRectangle(cornerRadius: 10).stroke(.gray, style: StrokeStyle(lineWidth: 1))
        }
    }
}

enum DateType: String {
    case Food = "pizza.slice"
    case Game = "gamecontroller"
    case Activity = "star.fill"
}

#Preview {
    DateIdea(title: "Cook A Meal", desc: "cooking", type: .Food)
}
