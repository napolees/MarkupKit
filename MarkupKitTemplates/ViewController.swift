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

class ViewController: UITableViewController {
    // Outlets
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var footerSwitch: UISwitch!

    // Constants
    let dynamicSectionName = "dynamic"

    // View initialization
    override func loadView() {
        view = LMViewBuilder.viewWithName("View", owner: self, root: nil)

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Lorem Ipsum"
    }

    // Button press handler
    func buttonPressed() {
        let alertController = UIAlertController(title: "Alert", message: "Lorem ipsum dolor sit amet.", preferredStyle: .Alert)

        alertController.addAction(UIAlertAction(title: "OK", style: .Default, handler:nil))

        presentViewController(alertController, animated: true, completion: nil)
    }

    // Data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return tableView.numberOfSections
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let n: Int
        if (tableView.nameForSection(section) == dynamicSectionName) {
            n = 0
        } else {
            n = tableView.numberOfRowsInSection(section)
        }

        return n
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        if (tableView.nameForSection(indexPath.section) == dynamicSectionName) {
            cell = UITableViewCell() // TODO
        } else {
            cell = tableView.cellForRowAtIndexPath(indexPath)!
        }

        return cell
    }

    // Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (tableView.nameForSection(indexPath.section) == dynamicSectionName) {
            // TODO
        }
    }
}
