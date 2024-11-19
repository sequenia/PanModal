import UIKit

public class ContainerView: UIView {

    var isInteractiveBottomController = false
    var passthroughViews = [UIView]()

    public override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        var hittedView: UIView? = super.hitTest(point, with: event)
        if !self.isInteractiveBottomController { return hittedView }

        if hittedView == self {
            self.passthroughViews.forEach { passthroughView in
                hittedView = passthroughView.hitTest(
                    self.convert(point, to: passthroughView),
                    with: event
                )

                if hittedView != nil { return }
            }
        }

        return hittedView
    }
}
