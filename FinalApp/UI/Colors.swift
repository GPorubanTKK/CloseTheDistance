import SwiftUI
public let cardBackground = Color(red: 0.16, green: 0.22, blue: 0.27)
public let coralAccent = Color(red: 0.93, green: 0.45, blue: 0.34)
public let sageAccent = Color(red: 0.48, green: 0.65, blue: 0.64)
public let backgroundGradient = LinearGradient(
    colors: [Color(red: 0.15, green: 0.1, blue: 0.5), Color(red: 0.48, green: 0.10, blue: 0.40)],
    startPoint: .top,
    endPoint: .bottom
)

public func InitNavTitle() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    
    // Set colors for both large and collapsed inline titles
    let titleColor = UIColor(Color.white)
    appearance.largeTitleTextAttributes = [.foregroundColor: titleColor]
    appearance.titleTextAttributes = [.foregroundColor: titleColor]
    
    UINavigationBar.appearance().standardAppearance = appearance
    UINavigationBar.appearance().scrollEdgeAppearance = appearance
}
