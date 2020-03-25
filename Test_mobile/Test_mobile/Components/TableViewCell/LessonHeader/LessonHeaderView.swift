import UIKit

class LessonHeaderView: UITableViewHeaderFooterView, IdentifiableView, FillableViewProtocol {
    @IBOutlet private weak var backgroundHeaderView: UIView!
    @IBOutlet private weak var titleHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        self.initializer()
    }

    func fill(transporter: Transporter<Any>) {
        guard let title = transporter.data as? String else {
            return
        }

        self.titleHeaderLabel.text = title
    }
}

extension LessonHeaderView {
    private func initializer() {
        self.configureHeaderView()
        self.configureHeaderTitle()
    }

    private func configureHeaderView() {
        self.backgroundHeaderView.backgroundColor = .lightGray
    }

    private func configureHeaderTitle() {
        self.titleHeaderLabel.font = StyleGuide.Font.eighteenBold   
        self.titleHeaderLabel.textColor = .white
    }
}
