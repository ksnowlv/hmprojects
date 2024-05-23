class DividerTmp {
	strokeWidth: Length = 1
	startMargin: Length = 60
	endMargin: Length = 10
	color: ResourceColor = '#ffe9f0f0'

	constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
		this.strokeWidth = strokeWidth
		this.startMargin = startMargin
		this.endMargin = endMargin
		this.color = color
	}
}


@Entry
@Component
struct RowColumnPagePage {
	@State listDivider: DividerTmp = new DividerTmp(1, 60, 10, '#ffe9f0f0')

	@Builder navigationTitle() {
		Column() {
			Text('线性布局')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildPage() {

		List() {

			ListItem() {
				Column({ space: 10 }) {
					Text('Column容器内垂直方向排列 space:10')
						.fontSize(20)
						.fontColor(Color.Gray)
					Row().width('80%').height(30).backgroundColor(Color.Red)
					Row().width('80%').height(30).backgroundColor(Color.Green)
					Row().width('80%').height(30).backgroundColor(Color.Blue)
				}.width('100%')
				.height(200)
				.backgroundColor(Color.Orange)
			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Row({ space: 10 }) {
					Text('Column容器内水平方向排列 space: 10')
						.fontSize(20)
						.fontColor(Color.White)
						.width('40%')
					Row().width('10%').height(50).backgroundColor(Color.Red)
					Row().width('10%').height(50).backgroundColor(Color.Green)
					Row().width('10%').height(50).backgroundColor(Color.Blue)
				}.width('100%')
				.height(100).backgroundColor(Color.Black)
			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('HorizontalAlign.Start：子元素在水平方向左对齐')
						.fontSize(20)
					Column() {
					}.width('80%').height(30).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Blue)
				}.width('100%').alignItems(HorizontalAlign.Start).backgroundColor(Color.Grey)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Column({}) {
					Text('HorizontalAlign.Center：子元素在水平方向居中对齐')
						.fontSize(20)
					Column() {
					}.width('80%').height(30).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Blue)
				}.width('100%').alignItems(HorizontalAlign.Center).backgroundColor(Color.Orange)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Column({}) {
					Text('HorizontalAlign.End：子元素在水平方向右对齐')
						.fontSize(20).fontColor(Color.White)
					Column() {
					}.width('80%').height(30).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(30).backgroundColor(Color.Blue)
				}.width('100%').alignItems(HorizontalAlign.End).backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Row({}) {
					Text('VerticalAlign.Top：子元素在垂直方向顶部对齐')
						.fontSize(20).width('30%')
					Column() {
					}.width('20%').height(50).backgroundColor(Color.Red)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Green)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Blue)
				}.width('100%').height(100).alignItems(VerticalAlign.Top).backgroundColor(Color.Orange)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Row({}) {
					Text('VerticalAlign.Center：子元素在垂直方向居中对齐')
						.fontSize(20).width('30%').fontColor(Color.White)
					Column() {
					}.width('20%').height(50).backgroundColor(Color.Red)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Green)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Blue)
				}.width('100%').height(100).alignItems(VerticalAlign.Center).backgroundColor(Color.Black)
			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Row({}) {
					Text('VerticalAlign.Bottom：子元素在垂直方向底部对齐')
						.fontSize(20).width('30%')
					Column() {
					}.width('20%').height(50).backgroundColor(Color.Red)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Green)

					Column() {
					}.width('20%').height(50).backgroundColor(Color.Blue)
				}.width('100%').height(100).alignItems(VerticalAlign.Bottom).backgroundColor(Color.Orange)
			}.margin({ top: 10, bottom: 10 })


			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.Start)：元素在垂直方向方向首端对齐，第一个元素与行首对齐，同时后续的元素与前一个对齐')
						.fontSize(20).fontColor(Color.White)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Black).justifyContent(FlexAlign.Start)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.Center)：元素在垂直方向方向中心对齐，第一个元素与行首的距离与最后一个元素与行尾距离相同')
						.fontSize(20)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Yellow).justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.End)：元素在垂直方向方向尾部对齐，最后一个元素与行尾对齐，其他元素与后一个对齐')
						.fontSize(20)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Orange).justifyContent(FlexAlign.End)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.SpaceBetween)：垂直方向均匀分配元素，相邻元素之间距离相同。第一个元素与行首对齐，最后一个元素与行尾对齐')
						.fontSize(20).fontColor(Color.White)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Black).justifyContent(FlexAlign.SpaceBetween)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.SpaceAround)：垂直方向均匀分配元素，相邻元素之间距离相同。第一个元素到行首的距离和最后一个元素到行尾的距离是相邻元素之间距离的一半')
						.fontSize(20)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Orange).justifyContent(FlexAlign.SpaceAround)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {

				Column({}) {
					Text('justifyContent(FlexAlign.SpaceEvenly)：垂直方向均匀分配元素，相邻元素之间的距离、第一个元素与行首的间距、最后一个元素到行尾的间距都完全一样')
						.fontSize(20).fontColor(Color.White)
					Column() {
					}.width('80%').height(40).backgroundColor(Color.Red)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Green)

					Column() {
					}.width('80%').height(40).backgroundColor(Color.Blue)
				}.width('100%').height(300).backgroundColor(Color.Black).justifyContent(FlexAlign.SpaceEvenly)

			}.margin({ top: 10, bottom: 10 })
		}.divider(this.listDivider)
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