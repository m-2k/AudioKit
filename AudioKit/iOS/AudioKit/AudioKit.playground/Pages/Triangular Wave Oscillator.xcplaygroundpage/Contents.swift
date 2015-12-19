//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Triangle Oscillator
//: ### Generating audio
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance
let triangle = AKTriangleOscillator()
audiokit.audioOutput = triangle
audiokit.start()

let updater = AKPlaygroundLoop(every: 0.12) {
    let scale = [0,2,4,5,7,9,11,12]
    var note = scale.randomElement()
    let octave = randomInt(3...6)  * 12
    triangle.frequency = Float((note + octave).midiNoteToFrequency())
    triangle.amplitude.randomize(0, 0.3)
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)