//
//  ViewController.swift
//  f1 2022 driver
//
//  Created by JubeHuang黃冬伊 on 2022/8/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //driver's name
    @IBOutlet weak var charleLeclercLabel: UILabel!
    @IBOutlet weak var carloLabel: UILabel!
    @IBOutlet weak var georgeLabel: UILabel!
    @IBOutlet weak var lewisLabel: UILabel!
    @IBOutlet weak var sergioLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    //加入slider & numberLabel
    @IBOutlet weak var volumnLabel: UILabel!
    @IBOutlet weak var volumnSlider: UISlider!
    @IBOutlet weak var pitchLabel: UILabel!
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        redRadiusShape()
        
        
    }
    //sliderChange
    @IBAction func pitchChange(_ sender: Any) {
        pitchLabel.text = String(format: "%.2f", pitchSlider.value)
    }
    @IBAction func volumnChange(_ sender: Any) {
        volumnLabel.text = String(format: "%.2f", volumnSlider.value)
    }
    @IBAction func speedChange(_ sender: Any) {
        speedLabel.text = String(format: "%.2f", speedSlider.value)
    }
    //driver's btn
    @IBAction func charlesBtn(_ sender: Any) {
        speak(what: charleLeclercLabel.text!, country: "fr-FR")
    }
    @IBAction func carloBtn(_ sender: Any) {
        speak(what: carloLabel.text!, country: "es-ES")
    }
    @IBAction func maxBtn(_ sender: Any) {
        speak(what: maxLabel.text!, country: "nl-NL")
    }
    @IBAction func sergioBtn(_ sender: Any) {
        speak(what: sergioLabel.text!, country: "es-MX")
    }
    @IBAction func lewisBtn(_ sender: Any) {
        speak(what: lewisLabel.text!, country: "en-GB")
    }
    @IBAction func georgeBtn(_ sender: Any) {
        speak(what: georgeLabel.text!, country: "en-GB")
    }
    //reset btn
    @IBAction func resetBtn(_ sender: Any) {
        speedSlider.value = 0.55
        pitchSlider.value = 1
        volumnSlider.value = 0.55
        speedLabel.text = "0.55"
        pitchLabel.text = "1"
        volumnLabel.text = "0.55"
    }
    func redRadiusShape() {
        let redRadiusShapePath = UIBezierPath()
        let redRadiusShapeLayer = CAShapeLayer()
        redRadiusShapePath.move(to: CGPoint(x: 375, y: 604))
        redRadiusShapePath.addLine(to: CGPoint(x: 375, y: view.bounds.height))
        redRadiusShapePath.addLine(to: CGPoint(x: 0, y: view.bounds.height))
        redRadiusShapePath.addLine(to: CGPoint(x: 0, y: 629))
        redRadiusShapePath.addQuadCurve(to: CGPoint(x: 25, y: 604), controlPoint: CGPoint(x: 0, y: 604))
        redRadiusShapeLayer.path = redRadiusShapePath.cgPath
        redRadiusShapeLayer.fillColor = CGColor(red: 1, green: 6/255, blue: 0, alpha: 1)
        view.layer.insertSublayer(redRadiusShapeLayer, at: 0)
    }
    func speak(what:String, country:String) {
        let speechUtterance = AVSpeechUtterance(string: what)
        let synthesizer = AVSpeechSynthesizer()
        speechUtterance.rate = speedSlider.value
        speechUtterance.pitchMultiplier = pitchSlider.value
        speechUtterance.volume = volumnSlider.value
        speechUtterance.voice = AVSpeechSynthesisVoice(language: country)
        synthesizer.speak(speechUtterance)
    }

}

