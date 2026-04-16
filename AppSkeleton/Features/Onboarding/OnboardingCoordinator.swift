import Foundation

/// Coordinates the onboarding feature and owns its view model.
@Observable
@MainActor
final class OnboardingCoordinator: Coordinator {

    /// View model that drives the paged onboarding flow.
    let viewModel = OnboardingFlowViewModel()
}
