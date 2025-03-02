//
//  MainViewController.swift
//  PickColor
//
//  Created by Denis Lachikhin on 17.02.2025.
//

import UIKit

class ColorPickerViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    weak var delegate: ColorPickerVCDelegate?
    
    var viewColor: UIColor!
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        colorView.layer.cornerRadius = 15
        setSliders(From: viewColor)
        setupUIText()
        setColor()
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: - IB Actions
    @IBAction private func pickColor(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLabel.text = string(from: redSlider)
            redTextField.text = string(from: redSlider)
        case greenSlider:
            greenLabel.text = string(from: greenSlider)
            greenTextField.text = string(from: greenSlider)
        default:
            blueLabel.text = string(from: blueSlider)
            blueTextField.text = string(from: blueSlider)
        }
    }
    @IBAction func doneDidTapped() {
        delegate?.getViewColor(colorView)
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: redSlider.value.cgFloat(),
            green: greenSlider.value.cgFloat(),
            blue: blueSlider.value.cgFloat(),
            alpha: 1
        )
    }
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    private func setSliders(From color: UIColor) {
        redSlider.value = color.components.red
        greenSlider.value = color.components.green
        blueSlider.value = color.components.blue
    }
    private func setupUIText() {
        redLabel.text = string(from: redSlider)
        greenLabel.text = string(from: greenSlider)
        blueLabel.text = string(from: blueSlider)
        
        redTextField.text = string(from: redSlider)
        greenTextField.text = string(from: greenSlider)
        blueTextField.text = string(from: blueSlider)
    }
    private func getColorFromFields() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redTextField.float()),
            green: CGFloat(greenTextField.float()),
            blue: CGFloat(blueTextField.float()),
            alpha: 1
        )
    }
    private func showAlert(WithTitle title: String, andMessage message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Float
extension Float {
    func cgFloat() -> CGFloat {
        CGFloat(self)
    }
}
// MARK: - UIColor
 extension UIColor {
    var color: CIColor {
        CIColor(color: self)
    }
    var components: (
        red: Float,
        green: Float,
        blue: Float,
        alpha: Float
    ) {
        let color = self.color
        return (
            Float(color.red),
            Float(color.green),
            Float(color.blue),
            Float(color.alpha)
        )
    }
}

// MARK: - UITextField
extension UITextField {
    func float() -> Float {
        if let number = self.text {
            return Float(number) ?? 0
        } else {
            return 0
        }
    }
}
// MARK: - UITextFieldDelegate
extension ColorPickerViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard (Float(textField.text ?? "") != nil) else {
            showAlert(WithTitle: "Внимание!",
                      andMessage: "Введите число от 0 до 1")
            return
        }
        
        if textField == redTextField {
            if textField.float() > 1 {
                redTextField.text = "1.00"
            } else if textField.float() < 0 {
                redTextField.text = "0.00"
            }
            
            redLabel.text = redTextField.text
            redSlider.setValue(redTextField.float(), animated: true)
            getColorFromFields()
        } else if textField == greenTextField {
            if textField.float() > 1 {
                greenTextField.text = "1.00"
            } else if textField.float() < 0 {
                greenTextField.text = "0.00"
            }
            
            greenLabel.text = greenTextField.text
            greenSlider.setValue(greenTextField.float(), animated: true)
            getColorFromFields()
        } else if textField == blueTextField {
            if textField.float() > 1 {
                blueTextField.text = "1.00"
            } else if textField.float() < 0 {
                blueTextField.text = "0.00"
            }
            
            blueLabel.text = blueTextField.text
            blueSlider.setValue(blueTextField.float(), animated: true)
            getColorFromFields()
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
