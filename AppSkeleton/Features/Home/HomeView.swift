import SwiftUI

/// The main home screen shown after onboarding is complete.
struct HomeView: View {

    var viewModel: HomeViewModel

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Text(viewModel.greeting)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .accessibilityLabel(viewModel.greeting)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Home")
        }
    }
}
