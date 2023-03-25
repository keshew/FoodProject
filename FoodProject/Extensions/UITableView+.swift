import UIKit

class AutoSizing: UITableView {

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
    
    override func reloadData() {
        super.reloadData()
        invalidateIntrinsicContentSize()
    }
}
