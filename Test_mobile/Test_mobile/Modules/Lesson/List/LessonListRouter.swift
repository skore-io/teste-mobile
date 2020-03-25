import UIKit

protocol LessonListRoutable: class {
    func createModule() -> UIViewController
    func showAlert(from view: LessonListViewable?, infoAlert: FillSimpleAlert?)
}

class LessonListRouter: LessonListRoutable {
    private var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }

    func createModule() -> UIViewController {
        let navigationControllerIdentifier = "LessonNavigationController"
        
        guard
            let navController = self.storyboard.instantiateViewController(withIdentifier: navigationControllerIdentifier) as? UINavigationController,
            let lessonListView = navController.topViewController as? LessonListView else {
                fatalError("Invalid View Controller")
        }
        
        let lessonListInteractor: LessonListInteractable = LessonListInteractor()

        typealias PresenterProtocols = (LessonListPresentable &
                                        LessonListShowScreen &
                                        TableViewPresentableInterface &
                                        RemovableLesson)

        let lessonListPresenter: PresenterProtocols = LessonListPresenter(view: lessonListView,
                                                                          interactor: lessonListInteractor,
                                                                          router: self)

        lessonListInteractor.presenter = lessonListPresenter
        lessonListView.presenter = lessonListPresenter

        return lessonListView
    }

    func showAlert(from view: LessonListViewable?, infoAlert: FillSimpleAlert?) {
        guard
            let currentViewController = view as? UIViewController,
            let infoAlert = infoAlert else {
                return
        }

        let alertViewController = UIAlertController(title: infoAlert.title,
                                                    message: infoAlert.description,
                                                    preferredStyle: .alert)
        let actionButton = UIAlertAction(title: infoAlert.titleButton, style: .default) { _ in
            if infoAlert.hasCancelButton {
                infoAlert.alertActionHandle?.hasComplementAction(true, data: infoAlert.dataHandle)
            }
        }

        if infoAlert.hasCancelButton {
            let cancelButton = UIAlertAction(title: "Cancelar", style: .cancel) { _ in
                infoAlert.alertActionHandle?.hasComplementAction(false, data: nil)
            }

            alertViewController.addAction(cancelButton)
        }
        
        alertViewController.addAction(actionButton)

        currentViewController.performUIUpdate {
            currentViewController.present(alertViewController,
                                          animated: true,
                                          completion: nil)
        }
    }
}
