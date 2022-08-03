#  

## 영화 리뷰 다이어리

### 구현 목표
- Naver 영화 API 사용하여 검색 후 영화 이미지 가져오기 []
- 영화 리뷰 작성하고 저장하기 []
- 리뷰 공유하기 []

### 추가 구현 목표
- 꼭 영화만 검색할 필요가 있나 책도 검색하자 []
- 다른 이미지를 쓰고 싶을 수도 있으니 이미지 업로드를 가능하게 만들자 []

### 주력으로 사용할 프레임워크
- SwiftUI
- CoreData
- Combine
- SwiftLint
- Alamofire  
- Kingfisher     

### 심여를 기울일 부분 
- Async-await
- OSLog
- MVVM

### SwiftLint 설치하기
> https://github.com/realm/SwiftLint

1. Using CocoaPods
```
pod 'SwiftLint'
```
- This is the recommended way to install a specific version of SwiftLint since it supports installing a pinned version rather than simply the latest (which is the case with Homebrew).
- Note that this will add the SwiftLint binaries, its dependencies' binaries, and the Swift binary library distribution to the Pods/ directory, so checking in this directory to SCM such as git is discouraged.

2. pod install
```
arch -x86_64 pod install
```
- 왜인지는 모르겠지만 arm64 로는 pod install이 되지 않는다.

3. Run Script 추가
```
${PODS_ROOT}/SwiftLint/swiftlint
```

4. .swiftlint.yml 추가

### CoreData 기본 기능 구현 코드 샘플

#### 화면
```swift
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
```

#### 메서드
```swift
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
```

### SwiftUI Features

#### 1. searchable

과거에는 서치바를 만들기 위해서는 밑바닥부터 하나하나 구현해야했지만 
WWDC2021에서 searchquery를 처리하기 위한 새로운 기능이 소개되었다.
`searchable(text:placement:prompt:)`
