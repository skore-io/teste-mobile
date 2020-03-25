class SectionBuilder {
    private lazy var factory: AbstractSectionFactory? = SectionFactory()

    func build(header: ListableComponent?, rows: [ListableComponent]?, footer: ListableComponent?) -> SectionViewable? {
        return factory?.createSection(header: header, rows: rows, footer: footer)
    }
}
