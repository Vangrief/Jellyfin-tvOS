import SwiftUI

struct ToolbarClock: View {
    @State private var currentTime = Date()
    @EnvironmentObject var theme: MoonfinTheme
    @EnvironmentObject var container: AppContainer

    private let timer = Timer.publish(every: 30, on: .main, in: .common).autoconnect()

    var body: some View {
        Text(timeString)
            .font(.titleXl)
            .fontWeight(.medium)
            .foregroundColor(theme.colorScheme.onBackground.opacity(0.9))
            .monospacedDigit()
            .onReceive(timer) { currentTime = $0 }
    }

    private static let twelveHourFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "h:mm a"
        return f
    }()

    private static let twentyFourHourFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "HH:mm"
        return f
    }()

    private var timeString: String {
        let use24HourClock = container.userPreferences[UserPreferences.use24HourClock]
        let formatter = use24HourClock ? Self.twentyFourHourFormatter : Self.twelveHourFormatter
        return formatter.string(from: currentTime)
    }
}
