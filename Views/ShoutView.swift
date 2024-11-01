import SwiftUI
import Shimmer

struct ShoutView: View {
    @Environment(\.appData) var appData
    @Environment(\.speechSynthesizerManager) var speechSynthesizerManager
    @State private var isEnableDisableVisible = false
    @State private var isShoutDisabled = false
    @State private var countdown = 0
    @State private var countdownActive = false
    @State private var countdownTask: Task<Void, Never>? // Track the countdown task

    var body: some View {
        VStack {
            Button {
                isShoutDisabled = true
                countdown = appData.selectedCountdownSeconds
                countdownActive = true

                // Start a new countdown task
                countdownTask = Task {
                    do {
                        // Countdown delay
                        try await Task.sleep(nanoseconds: UInt64(appData.selectedCountdownSeconds) * 1_000_000_000)

                        // Check if task is still active before speaking
                        if !Task.isCancelled {
                            await speechSynthesizerManager.startSpeaking(
                                appData.defaultMessage,
                                language: appData.selectedLanguageType.rawValue
                            )
                        }

                        isShoutDisabled = false
                        countdownActive = false
                    } catch {
                        // Handle cancellation
                        countdownActive = false
                    }
                }
            } label: {
                Image("HeroImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .background(isShoutDisabled ? Color.gray : Color.primary.opacity(0.8))
                    .clipShape(Circle())
            }
            .buttonStyle(PlainButtonStyle()) // Removes default button styling
            .disabled(isShoutDisabled)

            // Countdown Display
            if countdownActive && countdown > 0 {
                HStack {
                    Button {
                        // Stop speech and cancel countdown
                        speechSynthesizerManager.stopSpeaking()
                        isShoutDisabled = false
                        countdownActive = false
                        countdownTask?.cancel() // Cancel the countdown task
                        countdownTask = nil
                    } label: {
                        HStack(spacing: 2) {
                            Image(systemName: "xmark.circle.fill")
                                .font(.title)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    .foregroundStyle(.accent)

                    Text("\(countdown) seconds remaining")
                        .font(.headline)
                        .padding(.leading)
                        .onAppear {
                            startCountdown()
                        }
                }
                .opacity(appData.selectedCountdownSeconds >= 5 && isShoutDisabled ? 1 : 0)
            }
        }
    }

    // Countdown timer function
    private func startCountdown() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            if countdown > 0 && countdownActive {
                countdown -= 1
            } else {
                timer.invalidate()
                countdownActive = false
            }
        }
    }
}

#Preview {
    ShoutView()
}
