class SectionComponent: SectionViewable {
    var header: ListableComponent?
    var rows: [ListableComponent]?
    var footer: ListableComponent?

    init(header: ListableComponent?, rows: [ListableComponent]?, footer: ListableComponent?) {
        self.header = header
        self.rows = rows
        self.footer = footer
    }
}
