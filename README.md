
![plog](https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/8e83931c-a94a-44ad-bbc4-3db291e2afa4)

## [미출시] 같이줍깅 | 23.07.09 ~ 23.08.03 (1달)

<aside>
⭐ 플로깅을 즐거운 경험으로 만들어주자!
  
포항 영일대에 직접 플로깅을 다녀오며 사람들이 길이나 바다에 버리는 쓰레기 문제에 심각성을 느꼈습니다. 또한 동시에 플로깅을 사람들이 자주 하면 환경에 좋은 영향을 끼칠 것이라고 생각했습니다. 사람들이 플로깅을 자주 할 수 있도록 플로깅을 즐거운 경험으로 만들어주고 싶어 같이줍깅을 만들었습니다.

</aside>

![ㅔㅔㅔㅔㅔㅔ](https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/b5f7a6ca-054b-4377-a740-f63379fa5106)

### 🧑‍🤝‍🧑 팀, 프로젝트 구성

- iOS 4명, 디자인 2명
- iOS 16.2+
- watchOS 9.4+

### 🥕 기능

- 캐릭터, 닉네임 설정


### 🔨 기술 스택 및 사용한 라이브러리

- SwiftUI
- MapKit
- GameKit
- ARKit
- CoreData
- CoreML
- CreateML
- CoreMotion

### 👏 해당 기술을 사용하며 이룬 성과

#### 1. 디자이너의 디자인 시스템을 코드로 올려 재사용성을 높임

~~~swift
struct ButtonView: View {
    let text: String
    @Binding var isdisable: Bool
    let action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ButtonLabel(text: text, isdisable: $isdisable)
        }
        .disabled(isdisable)
    }
}

struct NavigationLinkView<Destination: View>: View {
    let text: String
    @Binding var isdisable: Bool
    let destination: Destination

    var body: some View {
        NavigationLink {
            destination
        } label: {
            ButtonLabel(text: text, isdisable: $isdisable)
        }
        .disabled(isdisable)
		.navigationBarBackButtonHidden()
    }
}
~~~

~~~swift
extension Font {
    enum Jamsil: String {
        case thin = "TheJamsilOTF1Thin"
        case light = "TheJamsilOTF2Light"
        case regular = "TheJamsilOTF3Regular"
        case medium = "TheJamsilOTF4Medium"
        case bold = "TheJamsilOTF5Bold"
        case extraBold = "TheJamsilOTF6ExtraBold"
        
        func font(size: CGFloat) -> Font {
            return Font.custom(rawValue, size: size)
        }
    }
}
~~~

~~~swift
extension Color {
  init(hexCode: String) {
    let scanner = Scanner(string: hexCode)
    _ = scanner.scanString("#")
    
    var rgbColor: UInt64 = 0
    scanner.scanHexInt64(&rgbColor)
    
    let rColor = Double((rgbColor >> 16) & 0xFF) / 255.0
    let gColor = Double((rgbColor >>  8) & 0xFF) / 255.0
    let bColor = Double((rgbColor >>  0) & 0xFF) / 255.0
    self.init(red: rColor, green: gColor, blue: bColor)
  }
}

extension Color {
    static let defaultColor = Color(hexCode: "#28CBAE")
    static let backgroundColor = Color(hexCode: "#B8E3D4")
    static let background2Color = Color(hexCode: "#DBEDE7")
    static let disableColor = Color(hexCode: "#B3B3B3")
    static let buttonBackgroundColor = Color(hexCode: "F5F5F5")
    static let beforeImagePickColor = Color(hexCode: "#C4C4C4")
    static let beforeImagePickTextColor = Color(hexCode: "#1A8370")
    static let fontColor = Color(hexCode: "#1A8370")
    static let accentFontColor = Color(hexCode: "#106051")
    static let calendarNumberBackground = Color(hexCode: "#E5F9F5")
    static let watchCharacterBackground = Color(hexCode: "#62D8AD")
}
~~~


### 🌠 Trouble Shooting

#### 1. 캐릭터 선택에서 디자인, 개발 공수를 줄이기 위해 얼굴형과 표정을 분리하여 이미지를 합치는 식으로 구현하였음.
~~~swift
let faceArray: [String] = ["face_bag_", "face_can_", "face_dust_", "face_twin_", "face_centerbag_", "face_pet_", "face_jellyfish_", "face_plasticbag_"]
let colorArray: [String] = ["gray", "green", "lightpurple", "mystic", "pink", "orange", "yellow"]
let emotionArray: [String] = ["emotion_1", "emotion_2", "emotion_3", "emotion_4", "emotion_5", "emotion_6", "emotion_7", "emotion_8"]

Image(uiImage: viewModel.imageMerger.merge("\(viewModel.faceArray[viewModel.characterFace] + viewModel.colorArray[viewModel.characterColor])", with: "\(viewModel.emotionArray[viewModel.characterEmotion])"))
~~~

### 🗂️ 폴더 구조
~~~
📦SixTech
 ┣ 📂API
 ┃ ┣ 📂Coredata
 ┃ ┣ 📂MapCore
 ┣ 📂Camera
 ┣ 📂Extension
 ┣ 📂JerryTest
 ┣ 📂Model
 ┃ ┣ 📂history.xcdatamodeld
 ┃ ┃ ┗ 📂history.xcdatamodel
 ┣ 📂UserMdoel
 ┃ ┗ 📂User.xcdatamodeld
 ┃ ┃ ┗ 📂User.xcdatamodel
 ┣ 📂Utills
 ┣ 📂View
 ┃ ┣ 📂CameraFilter
 ┃ ┣ 📂CharacterCreate
 ┃ ┣ 📂CountDown
 ┃ ┣ 📂GameView
 ┃ ┣ 📂ImagePicker
 ┃ ┣ 📂MainView
 ┃ ┣ 📂MapView
 ┃ ┣ 📂Mission
 ┃ ┣ 📂MyProfileDetail
 ┃ ┃ ┣ 📂Food
 ┃ ┃ ┗ 📂Info
 ┃ ┣ 📂Onboarding
 ┃ ┣ 📂ProfileView
 ┃ ┃ ┣ 📂HistoryView
 ┃ ┣ 📂Result
 ┃ ┗ 📂ShareImage
 ┣ 📂ViewComponent
 ┃ ┣ 📂ButtonStyle
 ┃ ┣ 📂Fonts
 ┣ 📂ViewModel
 ┃ ┣ 📂Camera
 ┗ ┗ 📂CharacterCreate
~~~

### 📺 앱 구동 화면

| 뷰 | 이미지 |
| --- | --- |
| 온보딩, 캐릭터 선택 뷰 | <img src="https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/9fadcbc4-6152-45f1-9120-5283fd2fd58a" width="188" height="408"> |
| 프로깅 시작, 미션 뽑기 뷰 | <img src="https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/8d122995-d0da-456e-b142-3e801d2e3b92" width="188" height="408"> |
| 캐릭터와 사진찍기 뷰 | <img src="https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/92cf21b3-41ea-4a90-8bde-5e76985de3df" width="188" height="408"> |
| 사진 선택 뷰 | <img src="https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/8bb35e4a-5704-4aa2-acfe-be9b0441b21f" width="188" height="408"> |
| 결과 뷰 | <img src="https://github.com/Oreo-Mcflurry/Let-s-Plogging/assets/96654328/b6a20312-35a3-45d4-a0b0-5be98afe3545" width="188" height="408"> |
