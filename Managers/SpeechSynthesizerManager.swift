import AVFoundation
import Observation
import SwiftUI

@Observable
final class SpeechSynthesizerManager {
    private let synthesizer = AVSpeechSynthesizer()

    // Start speaking the provided text with optional parameters for language, pitch, and rate.
    func startSpeaking(_ text: String, language: String = "en-US", pitch: Float = 1.0, rate: Float = 0.5) async {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.pitchMultiplier = pitch
        utterance.rate = rate
        synthesizer.speak(utterance)
    }

    // Stop speaking immediately if the synthesizer is currently speaking.
    func stopSpeaking() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }
}


// Define the custom EnvironmentKey for SpeechSynthesizerManager
struct SpeechSynthesizerManagerKey: EnvironmentKey {
    static let defaultValue = SpeechSynthesizerManager() // Default instance, useful for previews or testing
}

// Extend EnvironmentValues to include the SpeechSynthesizerManager
extension EnvironmentValues {
    var speechSynthesizerManager: SpeechSynthesizerManager {
        get { self[SpeechSynthesizerManagerKey.self] }
        set { self[SpeechSynthesizerManagerKey.self] = newValue }
    }
}
