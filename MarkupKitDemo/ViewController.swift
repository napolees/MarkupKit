//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import UIKit
import MarkupKit

class ViewController: UITableViewController, UIPickerViewDelegate {
    weak var dateTextField: UITextField!

    weak var sizeTextField: UITextField!
    weak var sizePickerView: LMPickerView!

    weak var accessoryTextField: UITextField!

    weak var stepper: UIStepper!
    weak var slider: UISlider!
    weak var pageControl: UIPageControl!
    weak var progressView: UIProgressView!

    override func loadView() {
        view = LMViewBuilder.viewWithName("View", owner: self, root: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "MarkupKit Demo"
        
        tableView.delegate = self
        
        sizePickerView.delegate = self

        slider.minimumValue = Float(stepper.minimumValue)
        slider.maximumValue = Float(stepper.maximumValue)

        stepperValueChanged(stepper)
    }

    override func viewWillLayoutSubviews() {
        tableView.contentInset = UIEdgeInsetsMake(topLayoutGuide.length, 0, bottomLayoutGuide.length, 0)
    }

    func updateDateTextField(datePicker: UIDatePicker) {
        let dateFormatter = NSDateFormatter()

        dateFormatter.dateFormat = "yyyy-MM-dd"

        dateTextField.text = dateFormatter.stringFromDate(datePicker.date)
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == sizePickerView) {
            sizeTextField.text = pickerView.titleForRow(row, forComponent: component)
        }
    }

    func showGreeting() {
        let alertController = UIAlertController(title: "Greeting", message: "Hello!", preferredStyle: .Alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler:nil))

        presentViewController(alertController, animated: true, completion: nil)
    }

    func cancelEdit() {
        accessoryTextField.resignFirstResponder()
    }

    func updateText(sender: UIBarButtonItem) {
        accessoryTextField.text = sender.title

        accessoryTextField.resignFirstResponder()
    }

    func stepperValueChanged(sender: UIStepper) {
        slider.value = Float(sender.value)

        updateState()
    }

    func sliderValueChanged(sender: UISlider) {
        stepper.value = Double(sender.value)

        updateState()
    }

    func updateState() {
        let value = slider.value

        pageControl.currentPage = Int(round(value * 10))
        progressView.progress = value
    }
}
