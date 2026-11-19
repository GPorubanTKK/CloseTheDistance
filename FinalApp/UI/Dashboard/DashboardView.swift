import SwiftUI

struct DashboardView: View {
    var body: some View {
        
        VStack {
            HStack{
                VStack (alignment: .leading, spacing: 4){
                    
                    Text("Couple Name")
                        .font(.title2)
                        .foregroundStyle(.secondary)
                    
                    Text("Jane & Bingly")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    
                }
                
                
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4){
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0.2, green: 0.5, blue: 0.5))
                    .scaledToFit()
                    .padding()
                
                
                    
                Spacer()
            }
            VStack (alignment: .center, spacing: 4){
                HStack{
                    Text("Notifications")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Button("Clear") { }
                            .buttonStyle(.borderedProminent)
                            .buttonBorderShape(.capsule)
                            .controlSize(.large)
                }
                
                Spacer()
                ScrollView{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.2, green: 0.5, blue: 0.5))
                        .scaledToFit()
                        .padding()
                }
            }
            
            
        }
        
        
        
        
    }
}

#Preview {
    DashboardView()
}
