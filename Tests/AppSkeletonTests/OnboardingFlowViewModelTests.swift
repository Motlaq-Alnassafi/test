import Testing
@testable import WelcomeFeatureiOSApp

@Suite("OnboardingFlowViewModel Tests")
@MainActor
struct OnboardingFlowViewModelTests {

    @Test("Initial page is zero")
    func initialPage() {
        let viewModel = OnboardingFlowViewModel()
        #expect(viewModel.currentPage == 0)
    }

    @Test("Total pages is four")
    func totalPages() {
        let viewModel = OnboardingFlowViewModel()
        #expect(viewModel.totalPages == 4)
    }

    @Test("Progress is 25% on page 1")
    func initialProgress() {
        let viewModel = OnboardingFlowViewModel()
        #expect(viewModel.progress == 0.25)
    }

    @Test("Progress updates correctly as pages change")
    func progressUpdates() {
        let viewModel = OnboardingFlowViewModel()

        viewModel.currentPage = 1
        #expect(viewModel.progress == 0.5)

        viewModel.currentPage = 2
        #expect(viewModel.progress == 0.75)

        viewModel.currentPage = 3
        #expect(viewModel.progress == 1.0)
    }

    @Test("isOnLastPage is false for pages 0-2 and true for page 3")
    func isOnLastPage() {
        let viewModel = OnboardingFlowViewModel()

        for page in 0..<3 {
            viewModel.currentPage = page
            #expect(!viewModel.isOnLastPage, "Expected isOnLastPage == false for page \(page)")
        }

        viewModel.currentPage = 3
        #expect(viewModel.isOnLastPage)
    }
}
