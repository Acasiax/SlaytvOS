/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI

struct VideoThumbnailView: View {
  var video: Video

  @Environment(\.isFocused) var isFocused: Bool

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      Image(video.thumbnailName)
        // 1
        .resizable()
        // 2
        .renderingMode(.original)
        // 3
        .aspectRatio(contentMode: .fill)
        // 4
        .frame(width: 450, height: 255)
        // 1
        .clipped()
        // 2
        .cornerRadius(10)
        // 3
        .shadow(radius: 5)
      // 1
      VStack(alignment: .leading) {
        // 2
        Text(video.title)
          .foregroundColor(.primary)
          .font(.headline)
          .bold()
        // 3
        Text(video.description.isEmpty ? "No description provided for this video." : video.description)
          .font(.subheadline)
          .foregroundColor(.secondary)
          .multilineTextAlignment(.leading)
          .lineLimit(2)
          .frame(height: 80)
      }
    }
  }
}

struct VideoItem_Previews: PreviewProvider {
  static var previews: some View {
    VideoThumbnailView(
      video: Video(
        title: "Introduction to ARKit",
        description: "Learn about ARKit in this amazing tutorial!",
        thumbnailName: "arkit"
      )
    )
  }
}
