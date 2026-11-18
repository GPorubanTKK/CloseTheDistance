import SwiftUI
struct ThisOrThat : View {
    @StateObject var vm: ThisOrThatVM = ThisOrThatVM()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).foregroundStyle(.cyan.opacity(0.3))
            VStack {
                Text("This Or That").bold().font(.system(.largeTitle))
                Text("\(vm.question)?")
                HStack {
                    Button {
                        vm.pickLeft()
                    } label: {
                        ThisOrThatButton(text: vm.leftOption)
                    }.disabled(vm.choice > 0)
                    Button {
                        vm.pickRight()
                    } label: {
                        ThisOrThatButton(text: vm.rightOption)
                    }.disabled(vm.choice == 0)
                }
            }.padding()
        }
    }
}

struct ThisOrThatButton: View {
    var text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
            Text(text).foregroundStyle(.white).padding([.leading, .trailing]).bold()
        }.padding()
    }
}

#Preview {
    ThisOrThat()
}
