
import UIKit

internal class ValueView: UIView, NibLoadable {
    @IBOutlet weak var valueLabel: UILabel!

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUIFromNib()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUIFromNib()
    }

    func setValue(_ value: Double) {
        valueLabel.text = String(format: "%.2f", value)
    }
}

