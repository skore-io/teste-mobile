protocol AbstractSectionFactory {
    func createSection(header: ListableComponent?, rows: [ListableComponent]?, footer: ListableComponent?) -> SectionViewable
}
