import SwiftUI

struct PullToRefresh: ViewModifier {
    
    @Binding var isRefreshing: Bool
    let onRefresh: () -> Void
    
    func body(content: Content) -> some View {
        content
            .overlay(
                GeometryReader { geometry in
                    if self.isRefreshing {
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                ProgressView()
                                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                Spacer()
                            }
                            .frame(width: geometry.size.width, height: 50)
                        }
                        .background(Color.white)
                        .opacity(0.8)
                    }
                }
            )
            .onPreferenceChange(RefreshableKeyTypes.PrefKey.self) { values in
                guard !values.isEmpty else { return }
                self.onRefresh()
            }
    }
}

struct RefreshableKeyTypes {
    struct PrefKey: PreferenceKey {
        static var defaultValue: [CGFloat] = []
        static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
            value.append(contentsOf: nextValue())
        }
    }
}
