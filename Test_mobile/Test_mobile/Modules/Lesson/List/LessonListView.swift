import UIKit

protocol LessonListViewable: class {
    var presenter: (LessonListShowScreen & TableViewPresentableInterface)? { get set }

    func updateScreen()
}

class LessonListView: UIViewController, LessonListViewable, IdentifiableView {
    var presenter: (LessonListShowScreen & TableViewPresentableInterface)?

    @IBOutlet private weak var lessonListTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initializer()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.presenter?.viewWillAppear()
    }

    func updateScreen() {
        self.performUIUpdate { [unowned self] in
            self.lessonListTableView.reloadData()
        }
    }
}

extension LessonListView {
    internal func initializer() {
        self.configureTableView()
        self.registerHeaderFooter()
        self.registerCell()
    }

    private func configureTableView() {
        self.lessonListTableView.delegate = self
        self.lessonListTableView.dataSource = self

        self.lessonListTableView.tableFooterView = UIView()
        self.lessonListTableView.rowHeight = UITableView.automaticDimension
        self.lessonListTableView.estimatedRowHeight = UITableView.automaticDimension
    }

    private func registerHeaderFooter() {
        guard let presenter = presenter else {
            return
        }

        _ = presenter.customHeader.map { [weak self] in
            self?.lessonListTableView.registerHeaderFooterView(identifier: $0)
        }
    }

    private func registerCell() {
        guard let presenter = presenter else {
            return
        }
        
        _ = presenter.customCells.map { [weak self] in
            self?.lessonListTableView.register($0.nib, forCellReuseIdentifier: $0.reuseIdentifier)
        }
    }
}

extension LessonListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter?.numberOfSections ?? .zero
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.numberOfRowsInSection(sec: section) ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = self.presenter,
            let tableViewComponent = presenter.obtainTableViewComponent(for: indexPath) else {
                return UITableViewCell()
        }

        let cell = UITableViewCell.createCellWithId(tableView: tableView,
                                                    indexPath: indexPath,
                                                    identifier: tableViewComponent.identifier)

        if let cell = cell as? FillableViewProtocol,
            let transporter = tableViewComponent.content {
            cell.fill(transporter: transporter)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let HEIGHT_FOR_HEADER_SECTION: CGFloat = 60

        if section != .zero {
            return .leastNonzeroMagnitude
        }

        return HEIGHT_FOR_HEADER_SECTION
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let presenter = self.presenter else {
            return nil
        }

        let identifier = presenter.headerCellIdentifier(sec: section)
        guard
            let cell: LessonHeaderView = UITableViewCell.createHeaderFooterCell(tableView: tableView,
                                                                                  identifier: identifier) else {
                                                                                    return nil
        }

        if let transporter = presenter.transporterForHeader(sec: section) {
            cell.fill(transporter: transporter)
        }

        return cell
    }
}

extension LessonListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.lessonListTableView.deselectRow(at: indexPath, animated: true)
    }
}

