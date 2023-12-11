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

struct VideoDetailView: View {
  @State var category: Category
  @ObservedObject var video: Video

  private var categoryWithCurrentVideoRemoved: Category {
    // Make a copy of the original category to not modify the original
    return Category(
      title: category.title,
      videos: category.videos.filter { filteredVideo in
        return filteredVideo != video
      }
    )
  }

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      HStack(alignment: .top, spacing: 40) {
        VStack(alignment: .leading) {
          Image(video.thumbnailName)
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: .fill)
            .frame(width: 675, height: 382)
            .clipped()
            .cornerRadius(10)
            .shadow(radius: 5)
          Text(video.title)
            .font(Font.title3)
            .bold()
          Text(video.description.isEmpty ? "No description provided for this video." : video.description)
            .foregroundColor(Color.secondary)
            .font(Font.headline)

          Divider()

          HStack(spacing: 40) {
            NavigationLink(destination: PlayerView()) {
              Image(systemName: "play.fill")
            }

            Button {
              video.favorite.toggle()
            } label: {
              Image(systemName: video.favorite ? "heart.fill" : "heart")
            }
          }.padding(.bottom, 50)

          if !categoryWithCurrentVideoRemoved.videos.isEmpty {
            CategoryRow(
              category: categoryWithCurrentVideoRemoved,
              customTitle: "Related Videos"
            )
          }
        }.padding()
      }
    }
  }
}
