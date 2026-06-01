import SwiftUI

struct ItemCardOverlays: View {
    let item: ServerItem

    @EnvironmentObject var theme: MoonfinTheme

    var body: some View {
        ZStack {
            if item.userData?.isFavorite ?? false {
                Image(systemName: "heart.fill")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(theme.colorScheme.recording)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .padding(8)
            }

            if let count = item.userData?.unplayedItemCount, count > 0 {
                Text("\(count)")
                    .font(.captionXs)
                    .fontWeight(.bold)
                    .foregroundColor(theme.colorScheme.onBadge)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 3)
                    .background(theme.colorScheme.badge)
                    .clipShape(Capsule())
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(8)
            } else if item.userData?.played ?? false {
                Image(systemName: "checkmark.circle.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(theme.isNeonPulseTheme ? theme.colorScheme.badge : .colorGreen500)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                    .padding(8)
            }

            if let progress = item.userData?.playedPercentage, progress > 0 {
                ProgressBarOverlay(progress: progress)
            }
        }
    }
}
