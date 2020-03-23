extension Array {
    func object(index: Int) -> Element? {
        if index >= .zero && index < self.count {
            return self[index]
        }

        return nil
    }
}
