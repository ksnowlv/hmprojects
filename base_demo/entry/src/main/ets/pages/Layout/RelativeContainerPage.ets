@Entry
@Component
struct RelativeContainerPage {
	@Builder navigationTitle() {
		Column() {
			Text('相对布局')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildPage() {

		List() {

			ListItem() {
				Column() {
					RelativeContainer() {
						Row()
							.width(100)
							.height(100)
							.backgroundColor(Color.Red)
							.alignRules({
								top: { anchor: '__container__', align: VerticalAlign.Top }, //以父容器为锚点，竖直方向顶头对齐
								middle: { anchor: '__container__', align: HorizontalAlign.Center } //以父容器为锚点，水平方向居中对齐
							})
							.id('row1') //设置锚点为row1


						Row() {
							Image($r('app.media.icon'))
						}
						.height(100)
						.width(100)
						.alignRules({
							top: { anchor: 'row1', align: VerticalAlign.Bottom }, //以row1组件为锚点，竖直方向低端对齐
							left: { anchor: 'row1', align: HorizontalAlign.Start } //以row1组件为锚点，水平方向开头对齐
						})
						.id('row2') //设置锚点为row2
						//.margin({ top: 20, left: 20 })

						Row()
							.width(100)
							.height(100)
							.backgroundColor(Color.Blue)
							.alignRules({
								top: { anchor: 'row2', align: VerticalAlign.Top }
							})
							.id('row3') //设置锚点为row3

						Row()
							.width(100)
							.height(100)
							.backgroundColor(Color.Green)
							.alignRules({
								top: { anchor: 'row2', align: VerticalAlign.Top },
								left: { anchor: 'row2', align: HorizontalAlign.End },
							})
							.id('row4') //设置锚点为row4

						Row()
							.width(100)
							.height(100)
							.backgroundColor(Color.Black)
							.alignRules({
								top: { anchor: 'row2', align: VerticalAlign.Bottom },
								middle: { anchor: 'row2', align: HorizontalAlign.Center }
								//left: { anchor: 'row2', align: HorizontalAlign.Start },
							})
							.id('row5') //设置锚点为row5
					}
					.width(300).height(300)
					.border({ width: 2, color: '#6699FF' })
				}
				.width('100%')
				.backgroundColor(Color.Orange)
				.alignItems(HorizontalAlign.Center) // 设置Column的alignItems属性
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10 })

		}
	}

	build() {
		Column() {
			Navigation() {
				this.buildPage()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)

		}.width('100%')
		.height('100%')
	}
}