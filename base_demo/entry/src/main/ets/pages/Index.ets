@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Divider()
        Button('OK', {type:ButtonType.Normal, stateEffect: true}).borderRadius(10).backgroundColor(0xff31abff).width(50).height(30)
      }
      .width('100%')
    }
    .height('100%')
  }
}