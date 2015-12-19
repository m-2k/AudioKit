//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)
//:
//: ---
//:
//: ## Square Wave Oscillator
//: ### Generating audio
import XCPlayground
import AudioKit

let audiokit = AKManager.sharedInstance
let square = AKSquareWaveOscillator()
audiokit.audioOutput = square
audiokit.start()

var t: Float = 0

let updater = AKPlaygroundLoop(every: 0.12) {

    square.pulseWidth = 0.99 - abs(0.9 * cos(t))
    t = t + 0.01
    square.amplitude.randomize(0, 0.2)
    
    let scale = [0,2,4,5,7,9,11,12]
    var note = scale.randomElement()
    let octave = randomInt(3...6)  * 12
    square.frequency = Float((note + octave).midiNoteToFrequency())
    square.amplitude.randomize(0, 0.3)
}

XCPlaygroundPage.currentPage.needsIndefiniteExecution = true

//: [TOC](Table%20Of%20Contents) | [Previous](@previous) | [Next](@next)