import SwiftUI

/// A horizontally swipable onboarding flow with a progress bar at the top.
///
/// The "Get Started" button only appears on page 4.
/// Swiping to page 4 does **not** complete onboarding — only the button tap does.
struct OnboardingFlowView: View {

    @Bindable var viewModel: OnboardingFlowViewModel
    let onGetStarted: () -> Void

    var body: some View {
        VStack(spacing: 0) {
            OnboardingProgressBar(progress: viewModel.progress)
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .padding(.bottom, 8)

            TabView(selection: $viewModel.currentPage) {
                OnboardingPage1View()
                    .tag(0)
                OnboardingPage2View()
                    .tag(1)
                OnboardingPage3View()
                    .tag(2)
                OnboardingPage4View(onGetStarted: onGetStarted)
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut(duration: 0.3), value: viewModel.currentPage)
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel("Onboarding flow")
    }
}
