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
import MapKit
import MarkupKit

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    @IBOutlet var latitudeTextField: UITextField!
    @IBOutlet var longitudeTextField: UITextField!
    
    let radius = 250.0
    
    override func loadView() {
        view = LMViewBuilder.view(withName: "MapViewController", owner: self, root: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Map View"

        edgesForExtendedLayout = UIRectEdge()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaultNotificationCenter = NotificationCenter.default
        
        defaultNotificationCenter.addObserver(self,
            selector: #selector(keyboardWillShow(_:)),
            name: NSNotification.Name.UIKeyboardWillShow,
            object: nil)

        defaultNotificationCenter.addObserver(self,
            selector: #selector(keyboardWillHide(_:)),
            name: NSNotification.Name.UIKeyboardWillHide,
            object: nil)
        
        latitudeTextField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        let defaultNotificationCenter = NotificationCenter.default
        
        defaultNotificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        defaultNotificationCenter.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(_ notification: Notification) {
        (view as! LMColumnView).bottomSpacing = ((notification as NSNotification).userInfo![UIKeyboardFrameBeginUserInfoKey]! as AnyObject).cgRectValue.size.height
    }
    
    func keyboardWillHide(_ notification: Notification) {
        (view as! LMColumnView).bottomSpacing = 0
    }
    
    @IBAction func showLocation() {
        let latitude = Double(latitudeTextField.text!)!
        let longitude = Double(longitudeTextField.text!)!
        
        if (latitude >= -90 && latitude <= 90 && longitude >= -180 && longitude <= 180) {
            let region = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: latitude, longitude: longitude), radius * 1000, radius * 1000)

            if (region.center.latitude + region.span.latitudeDelta <= 90
                && region.center.latitude - region.span.latitudeDelta >= -90) {
                mapView.setRegion(region, animated: true)
            }
        }
    }
}
