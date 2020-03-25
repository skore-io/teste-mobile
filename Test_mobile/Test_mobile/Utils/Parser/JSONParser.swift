import Foundation

class JSONParser {
    private let typeOfFile = "json"

    func parse<T>(_ fileName: String) throws -> T? where T: Decodable {
        guard let path = Bundle.main.path(forResource: fileName,
                                          ofType: self.typeOfFile) else {
            return nil
        }

        do {
            let data = try self.obtainFile(with: path)
            let decoder = JSONDecoder()

            return try decoder.decode(T.self, from: data)
        } catch {
            throw JSONParserError.messageError(error.localizedDescription)
        }
    }

    private func obtainFile(with path: String) throws -> Data {
        do {
            let urlPath = URL(fileURLWithPath: path)
            return try Data(contentsOf: urlPath, options: .mappedIfSafe)
        } catch {
            throw JSONParserError.messageError(error.localizedDescription)
        }
    }
}
