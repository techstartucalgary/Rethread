import Foundation
import SwiftUI
import Observation

@Observable class ScannerViewModel {

 var note: String = "This isn't being updated"
 var score: Int = 0
 var isLoading: Bool = true

    func uploadImageToScanner(base64String: String) {
        print("uploadImageToScanner: Started")
        isLoading = true
        print("isLoading set to true")

        guard let url = URL(string: "http://10.0.0.183:3002/api/v1/scanner/") else {
            print("Invalid URL")
            isLoading = false
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let json: [String: Any] = ["imageUrl": "data:image/jpeg;base64,\(base64String)"]
        print("JSON payload prepared")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: json)
            print("HTTP body set")
        } catch {
            print("Error: Unable to encode json to Data - \(error.localizedDescription)")
            isLoading = false
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {  // Ensure all UI updates are on the main thread
                if let error = error {
                    print("Error during URLSession data task: \(error.localizedDescription)")
                    self.isLoading = false
                    return
                }
                print("Network request completed")

                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode),
                      let responseData = data else {
                    print("Error with the response, unexpected status code: \(String(describing: response))")
                    self.isLoading = false
                    return
                }
                print("Response is valid")

                do {
                    print("Attempting to parse JSON")
                    if let json = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any],
                       let note = json["notes"] as? String,  // Ensure this key matches with your JSON response
                       let score = json["score"] as? Int {
                        self.note = note
                        self.score = score
                        print("Parsed JSON: note - \(note), score - \(score)")
                    } else {
                        print("Could not decode response data")
                        self.note = "Could not decode response data"
                    }
                } catch {
                    print("JSON parsing error: \(error.localizedDescription)")
                    self.note = "JSON parsing error: \(error.localizedDescription)"
                }

                self.isLoading = false
                print("isLoading set to false")
            }
        }.resume()
        print("Network request initiated")
        isLoading = false
    }

    func convertImageToBase64(img: UIImage) -> String {
        let base64String = img.jpegData(compressionQuality: 1.0)?.base64EncodedString() ?? ""
        print("Converting to base 64 - Result: \(base64String.prefix(100))...")
        return base64String
    }

    var isProcessing: Bool {
        get {
            return isLoading
        }
        set {
            print("isLoading changed from \(isLoading) to \(newValue) at \(Date())")
            isLoading = newValue
        }
    }

}
