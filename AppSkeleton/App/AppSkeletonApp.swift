import SwiftUI

/// The application entry point.
///
/// Uses ``AppCoordinator`` to decide whether to show the onboarding flow
/// or the home screen based on persisted onboarding-completion state.
@main
struct AppSkeletonApp: App {

    @State private var coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            switch coordinator.currentScreen {
            case .onboarding:
                if let onboarding = coordinator.onboardingCoordinator {
                    OnboardingFlowView(
                        viewModel: onboarding.viewModel,
                        onGetStarted: { coordinator.completeOnboarding() }
                    )
                }

            case .home:
                HomeView(viewModel: HomeViewModel())
            }
        }
    }
}
