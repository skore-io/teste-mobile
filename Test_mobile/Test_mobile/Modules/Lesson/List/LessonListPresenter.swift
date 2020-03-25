import UIKit

protocol LessonListPresentable: class {
    func didRetrieveLessonList(_ sections: [SectionViewable])
    func didFailedToReceiverLessonList(_ infoAlert: FillSimpleAlert?)
}

protocol LessonListShowScreen: class {
    var view: LessonListViewable? { get set }
    var interactor: LessonListInteractable? { get set }
    var router: LessonListRoutable? { get set }

    func viewWillAppear()
}

class LessonListPresenter: LessonListShowScreen, TableViewPresentableInterface {
    var sections: [SectionViewable]?
    
    weak var view: LessonListViewable?
    var interactor: LessonListInteractable?
    var router: LessonListRoutable?

    var customHeader: [String] {
        return [LessonHeaderView.identifier]
    }

    var customCells: [UITableViewCell.Type] {
        return [LessonTableViewCell.self]
    }
    
    init(view: LessonListViewable,
         interactor: LessonListInteractable,
         router: LessonListRoutable) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewWillAppear() {
        self.interactor?.retrieveLessonList()
    }
}

extension LessonListPresenter: LessonListPresentable {
    func didRetrieveLessonList(_ sections: [SectionViewable]) {
        self.sections = sections
        self.view?.updateScreen()
    }

    func didFailedToReceiverLessonList(_ infoAlert: FillSimpleAlert?) {
        self.router?.showAlert(from: self.view, infoAlert: infoAlert)
    }
}

extension LessonListPresenter: RemovableLesson, AlertActionHandle {
    func removeLesson(_ id: String) {
        let alert = FillSimpleAlert(title: "Remover Aula",
                                    description: "Deseja remover a aula?",
                                    titleButton: "Ok",
                                    hasCancelButton: true,
                                    dataHandle: id,
                                    alertActionHandle: self)

        self.router?.showAlert(from: self.view, infoAlert: alert)
    }

    func hasComplementAction(_ isHandle: Bool, data: Any?) {
        if !isHandle {
            return
        }

        guard
            let sections = self.sections,
            let rows = sections.first?.rows,
            let id = data as? String else {
                return
        }

        self.interactor?.removeSpecificLesson(rows, withID: id)
    }
}
