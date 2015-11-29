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

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LMPickerView : UIPickerView

/**
 * Inserts a new component.
 *
 * @param component The index at which the component will be inserted.
 */
- (void)insertComponent:(NSInteger)component;

/**
 * Deletes an existing component.
 *
 * @param component The index of the component to delete.
 */
- (void)deleteComponent:(NSInteger)component;

/**
 * Inserts a new row into the picker view.
 *
 * @param view The view representing the row to insert.
 * @param row The index of the row to insert.
 * @param component The component in which the row will be inserted.
 */
- (void)insertView:(UIView *)cell forRow:(NSInteger)row inComponent:(NSInteger)component;

/**
 * Deletes an existing row from the picker view.
 *
 * @param row The index of the row to delete.
 * @param component The component from which the row will be deleted.
 */
- (void)deleteViewForRow:(NSInteger)row inComponent:(NSInteger)component;

@end

NS_ASSUME_NONNULL_END