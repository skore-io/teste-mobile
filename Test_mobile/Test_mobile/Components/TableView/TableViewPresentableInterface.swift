import UIKit

protocol TableViewPresentableInterface {
    var sections: [SectionViewable]? { get set }
    var customHeader: [String] { get }
    var customCells: [UITableViewCell.Type] { get }
}

extension TableViewPresentableInterface {
    var hasSections: Bool {
        guard let sections = sections else {
            return false
        }
        
        return sections.count > 0 ? true : false
    }
    var numberOfSections: Int {
        guard let sections = sections else {
            return .zero
        }

        return sections.count
    }

    func numberOfRowsInSection(sec: Int) -> Int {
        guard
            let sections = sections,
            let section = sections.object(index: sec),
            let rows = section.rows else {
                return .zero
        }

        return rows.count
    }

    func headerCellIdentifier(sec: Int) -> String {
        guard
            let sections = sections,
            let section = sections.object(index: sec),
            section.rows != nil else {
                return .empty
        }

        guard
            let header = section.header else {
                return .empty
        }

        return header.identifier
    }

    func transporterForHeader(sec: Int) -> Transporter<Any>? {
        guard
            let sections = sections,
            let section = sections.object(index: sec),
            section.rows != nil else {
                return nil
        }

        guard
            let header = section.header,
            let headerData = header.content else {
                return nil
        }

        return headerData
    }

    func obtainTableViewComponent(for indexPath: IndexPath) -> ListableComponent? {
        let sectionPosition = indexPath.section
        let rowPosition = indexPath.row

        guard
            let sections = sections,
            let section = sections.object(index: sectionPosition),
            let rows = section.rows,
            let row = rows.object(index: rowPosition) else {
                return nil
        }

        return row
    }

    func headerHeight(_ estimateHeight: CGFloat, at sectionPositon: Int) -> CGFloat {
        let identifier = headerCellIdentifier(sec: sectionPositon)
        let hasHeader: Bool = identifier != .empty
        let height = hasHeader ? estimateHeight : .leastNonzeroMagnitude

        return height
    }

    func createHeaderCell(for tableView: UITableView, at sectionPosition: Int) -> UITableViewHeaderFooterView? {
        let identifier = self.headerCellIdentifier(sec: sectionPosition)

        if identifier == .empty {
            return nil
        }

        guard let headerCell = UITableViewCell.createHeaderFooterCell(tableView: tableView, identifier: identifier) else {
            return nil
        }

        if let headerCell = headerCell as? FillableViewProtocol,
            let transporter = transporterForHeader(sec: sectionPosition) {
            headerCell.fill(transporter: transporter)
        }

        return headerCell
    }

    func createCell(with tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let tableViewComponent = obtainTableViewComponent(for: indexPath) else {
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
}
