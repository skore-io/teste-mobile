import UIKit

protocol RemovableLesson {
    func removeLesson(_ id: String)
}

class LessonTableViewCell: UITableViewCell, IdentifiableView, FillableViewProtocol {
    private var removableLesson: RemovableLesson?

    @IBOutlet private weak var lessonNameLabel: UILabel!
    @IBOutlet private weak var idLessonLabel: UILabel!
    @IBOutlet private weak var removeButton: UIButton!
    @IBOutlet private weak var statusLessonLabel: UILabel!
    @IBOutlet private weak var dateLessonLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.initializer()
    }

    func fill(transporter: Transporter<Any>) {
        guard let lesson = transporter.data as? Lesson else {
            return
        }

        self.lessonNameLabel.text = lesson.name
        self.idLessonLabel.text = lesson.id
        self.dateLessonLabel.text = lesson.createdAt.toDateString
        
        self.removableLesson = lesson.removeLessonDelegate

        self.setStatus(lesson.status, percentage: lesson.summary.percentage)
    }

    func setStatus(_ status: String, percentage: Int?) {
        var textColor = UIColor.darkGray
        var textStatus = ""

        if status == StatusLesson.IN_PROGRESS.rawValue {
            textStatus = String(format: "%d%@ concluído", percentage ?? .zero, "%")
        }

        if status == StatusLesson.COMPLETED.rawValue {
            textStatus = "√"
            textColor = UIColor.green
        }

        self.statusLessonLabel.textColor = textColor
        self.statusLessonLabel.text = textStatus
    }

    @objc private func removeLesson(_ sender: UIButton) {
        self.removableLesson?.removeLesson(self.idLessonLabel.text ?? "")
    }
}

extension LessonTableViewCell {
    private func initializer() {
        self.configureLessonName()
        self.configureLessonIDLesson()
        self.configureRemoveButton()
        self.configureStatusLesson()
        self.configureDateLesson()
    }

    private func configureLessonName() {
        self.lessonNameLabel.font = StyleGuide.Font.seventeenBold
        self.lessonNameLabel.numberOfLines = .zero
    }

    private func configureLessonIDLesson() {
        self.idLessonLabel.font = StyleGuide.Font.elevenRegular
        self.idLessonLabel.textColor = UIColor.lightGray
        self.idLessonLabel.numberOfLines = .zero
    }

    private func configureRemoveButton() {
        self.removeButton.titleLabel?.font = StyleGuide.Font.twentyBold
        self.removeButton.setTitle("X", for: .normal)
        self.removeButton.setTitleColor(.red, for: .normal)
        self.removeButton.rounded()
        self.removeButton.backgroundColor = UIColor.white
        self.removeButton.shadowBlack()

        self.removeButton.removeTarget(self,
                                       action: #selector(self.removeLesson(_:)),
                                       for: .touchUpInside)
        self.removeButton.addTarget(self,
                                    action: #selector(self.removeLesson(_:)),
                                    for: .touchUpInside)
    }

    private func configureStatusLesson() {
        self.statusLessonLabel.font = StyleGuide.Font.fifteenRegular
    }

    private func configureDateLesson() {
        self.dateLessonLabel.font = StyleGuide.Font.twelve
        self.dateLessonLabel.textColor = UIColor.lightGray
        self.dateLessonLabel.textAlignment = .left
    }
}
