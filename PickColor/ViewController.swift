//
//  ViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 02.02.2025.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private var colorView: UIView!

    @IBOutlet private var redSlider: UISlider!
    @IBOutlet private var greenSlider: UISlider!
    @IBOutlet private var blueSlider: UISlider!
    
    @IBOutlet private var redValueLabel: UILabel!
    @IBOutlet private var greenValueLabel: UILabel!
    @IBOutlet private var blueValueLabel: UILabel!
    
    var redSliderValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupColorView()
        setupColorLabels()
    }
    
    @IBAction private func redSliderAction() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        colorView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    @IBAction private func greenSliderAction() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        colorView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    @IBAction private func blueSliderAction() {
        blueValueLabel.text = String(format: "%.1f", blueSlider.value)
        colorView.backgroundColor = .init(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1.0)
    }
    
    //MARK: - Setup UI
    private func setupColorLabels() {
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
    private func setupColorView() {
        colorView.layer.cornerRadius = 10
        
        colorView.backgroundColor = .init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1.0
        )
    }
}


