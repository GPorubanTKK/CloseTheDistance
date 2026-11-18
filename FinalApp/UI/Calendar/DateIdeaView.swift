import SwiftUI

struct DateIdea: View {
    var title: String
    var desc: String
    var type: DateType

    var body: some View {
        let color: Color =
            switch type {
            case .Food:
                .red
            case .Game:
                .green
            case .Activity:
                .yellow
            }

        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(color.opacity(0.4))
                Image(systemName: type.rawValue).foregroundStyle(color.opacity(0.9))
                    .padding()
                    .padding([.leading, .trailing], 10)
                    .font(.title)
            }.fixedSize(horizontal: true, vertical: false)
            VStack {
                Text(title).bold()
                Text(desc).foregroundStyle(.gray)
            }.padding()
            Spacer()
        }.fixedSize(horizontal: false, vertical: true).padding([.trailing]).background {
            RoundedRectangle(cornerRadius: 10).stroke(.gray, style: StrokeStyle(lineWidth: 1))
        }.clipShape(RoundedRectangle(cornerRadius: 10)).fixedSize()
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
