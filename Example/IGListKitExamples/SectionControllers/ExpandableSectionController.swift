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

class ExpandableSectionController: IGListSectionController, IGListSectionType {

    var expanded = false
    var object: String?

    func numberOfItems() -> Int {
        return 1
    }

    func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 101, height: 101)
    }

    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CollectionCell.self, for: self, at: index) as! CollectionCell
        cell.contentView.backgroundColor = UIColor.red
        cell.titleLabel.text = object
        cell.titleLabel.numberOfLines = expanded ? 0 : 1;
        if cell.snp.label() == nil {
            cell.snp.setLabel("cell")
            cell.contentView.snp.makeConstraints({ (make) in
                make.width.lessThanOrEqualTo(collectionContext!.containerSize.width)
            })
            cell.titleLabel.snp.makeConstraints({ (make) in
                make.edges.equalTo(UIEdgeInsetsMake(5, 5, 5, 5));
            })
        }
        return cell
    }

    func didUpdate(to object: Any) {
        self.object = object as? String
    }
    
    func didSelectItem(at index: Int) {
        expanded = !expanded
        collectionContext?.reload(self)
    }
    
}
