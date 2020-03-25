class SectionFactory: AbstractSectionFactory {
    func createSection(header: ListableComponent?, rows: [ListableComponent]?, footer: ListableComponent?) -> SectionViewable {
        return SectionComponent(header: header, rows: rows, footer: footer)
    }
}
