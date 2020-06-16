//
//  Synth.swift
//  Useless_Synth
//
//  Created by Alex Nascimento on 15/04/20.
//  Copyright © 2020 Alex Nascimento. All rights reserved.
//

// This was incorporated and adapted from a previous project of mine
// That can be found on: https://github.com/anascim/Useless-Synth
import AVFoundation

public class Synth {
    
    public static var synthQueue = DispatchQueue(label: "synth-queue")
    
    public var volume: Float {
        get { engine.mainMixerNode.outputVolume }
        set { engine.mainMixerNode.outputVolume = newValue }
    }
    
    private let engine = AVAudioEngine()
    private let outputFormat: AVAudioFormat
    private let inputFormat: AVAudioFormat?
    private let sampleRate: Float
    
    private var frequency: Float = 432 // la 432Hz
    private var amplitude: Float = 1
    private var phaseIncrement: Float
    private var phase: Float = 0 { didSet { if phase > TWO_PI { phase -= TWO_PI } } }
    
    public var signal: (Float) -> Float
    
    public var time: Float = 0
    
    public lazy var oscillator = AVAudioSourceNode { (_, _, frameCount, audioBufferList) -> OSStatus in

        let ablPointer = UnsafeMutableAudioBufferListPointer(audioBufferList)
        
        // for each frame in a packet
        for frame in 0..<Int(frameCount) {
            
            let sampleValue = self.signal(self.phase) * self.amplitude
            self.phase += self.phaseIncrement
            self.time += self.phaseIncrement
            for buffer in ablPointer {
                let channel: UnsafeMutableBufferPointer<Float> = UnsafeMutableBufferPointer(buffer)
//                channel[frame] = self.envelope.apply(volume: sampleValue, time: self.time)
                channel[frame] = sampleValue
            }
        }
        return noErr
    }
    
    public init() {
        self.engine.mainMixerNode.outputVolume = 0.0
        self.outputFormat = self.engine.outputNode.outputFormat(forBus: 0)
        self.inputFormat = AVAudioFormat(commonFormat: outputFormat.commonFormat,
                                    sampleRate: outputFormat.sampleRate,
                                    channels: 1,
                                    interleaved: outputFormat.isInterleaved)
        self.sampleRate = Float(outputFormat.sampleRate)
        self.phaseIncrement = (TWO_PI / sampleRate) * frequency
        self.signal = Synth.WaveForm.square
        self.engine.prepare()
        
        setupEngine()
    }

    public func play(note: Note, for duration: TimeInterval) {
        self.frequency = note.freq
        self.updatePhaseIncrement()
        self.volume = 0.3
        time = 0
//        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (_) in
//            self.volume = self.envelope.apply(volume: self.volume, time:  self.time)
//        }
        Timer.scheduledTimer(withTimeInterval: duration, repeats: false) { (timer) in
            self.volume = 0
        }
    }
    
    private func setupEngine() {
        Synth.synthQueue.sync {
            self.engine.attach(oscillator)
            self.engine.connect(oscillator, to: engine.mainMixerNode, format: inputFormat)
            self.engine.connect(engine.mainMixerNode, to: engine.outputNode, format: outputFormat)
            self.engine.mainMixerNode.outputVolume = 0.0

            startEngine()
        }
    }
    
    private func updatePhaseIncrement() {
        self.phaseIncrement = (TWO_PI / sampleRate) * frequency
    }
    
    private func startEngine() {
        do {
            try self.engine.start()
        } catch {
            print("Unable to start engine due to error: \(error)")
        }
    }

    private func stopEngine() {
        self.engine.stop()
    }
}
