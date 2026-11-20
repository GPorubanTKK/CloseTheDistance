import SwiftUI
struct ThisOrThat : View {
    @StateObject var vm: ThisOrThatVM = ThisOrThatVM()
    @Environment(CtdViewmodel.self) var appVm: CtdViewmodel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).foregroundStyle(cardBackground)
            VStack {
                Text("This Or That").bold().font(.system(.largeTitle))
                Text("\(vm.answer.q)?")
                HStack {
                    Button {
                        vm.pickLeft()
                        appVm.notify("You answered the This or That")
                    } label: {
                        ThisOrThatButton(text: vm.answer.l, selected: vm.choice < 1)
                    }.disabled(vm.choice != -1)
                    Button {
                        vm.pickRight()
                        appVm.notify("You answered the This or That")
                    } label: {
                        ThisOrThatButton(text: vm.answer.r, selected: vm.choice != 0)
                    }.disabled(vm.choice != -1)
                }
            }.padding()
        }.foregroundStyle(.white)
    }
}

struct ThisOrThatButton: View {
    var text: String
    var selected: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20).foregroundStyle(selected ? coralAccent : .gray.opacity(0.3))
            Text(text).foregroundStyle(.white).padding([.leading, .trailing]).bold()
        }.padding()
    }
}

#Preview {
    @Previewable @State var vm = CtdViewmodel()
    ThisOrThat().environment(vm)
}
