/**
 Copyright (c) 2016-present, Facebook, Inc. All rights reserved.

 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import UIKit
import IGListKit

class LabelSectionController: IGListSectionController, IGListSectionType {

    var object: String?

    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: collectionContext!.containerSize.width, height: 55)
    }

    fileprivate static let insets = UIEdgeInsets(top: 8, left: 15, bottom: 8, right: 15)
    fileprivate static let font = UIFont.systemFont(ofSize: 17)

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CollectionCell.self, for: self, at: index) as! CollectionCell
        cell.titleLabel.text = object
        if cell.snp.label() == nil {
            cell.snp.setLabel("cell")

            cell.titleLabel.font = LabelSectionController.font

            cell.separator.isHidden = false
            cell.separator.backgroundColor = UIColor(red: 200/255.0, green: 19/255.0, blue: 204/255.0, alpha: 1)

            let height: CGFloat = 0.5

            cell.titleLabel.snp.makeConstraints { (make) -> Void in
                make.edges.equalTo(LabelSectionController.insets)
            }
            cell.separator.snp.makeConstraints({ (make) in
                make.left.equalTo(LabelSectionController.insets.left);
                make.right.equalTo(0)
                make.height.equalTo(height);
                make.bottom.equalTo(0)
            })
        }
        return cell
    }

    func didUpdate(to object: Any) {
        self.object = object as? String
    }

    func didSelectItem(at index: Int) {}

}
