@Entry
@Component
struct FlexPage {
	@Builder navigationTitle() {
		Column() {
			Text('弹性布局')
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
					Flex({ direction: FlexDirection.Row }) {
						Text('FlexDirection.Row（默认值）：主轴为水平方向，子元素从起始端沿着水平方向开始排布')
							.backgroundColor(Color.Red)
							.width('70%')
							.height(40)
						Text('item 1').backgroundColor(Color.Blue).width('10%').height(40)
						Text('item 2').backgroundColor(Color.Green).width('10%').height(40)

					}
					.height(70)
					.width('90%')
					.padding(5)
					.backgroundColor(Color.Gray)

				}
			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ direction: FlexDirection.RowReverse }) {
					Text('主轴为水平方向，子元素从终点端沿着FlexDirection. Row相反的方向开始排布')
						.backgroundColor(Color.Red)
						.width('70%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('10%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('10%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Pink)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ direction: FlexDirection.Column }) {
					Text('主轴为垂直方向，子元素从起始端沿着垂直方向开始排布')
						.backgroundColor(Color.Red)
						.width('100%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('100%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('100%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Gray)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ direction: FlexDirection.ColumnReverse }) {
					Text('主轴为垂直方向，子元素从终点端沿着FlexDirection. Column相反的方向开始排布')
						.backgroundColor(Color.Red)
						.width('100%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('100%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('100%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Pink)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ wrap: FlexWrap.NoWrap }) {
					Text('不换行。如果子元素的宽度总和大于父元素的宽度，则子元素会被压缩宽度')
						.backgroundColor(Color.Red)
						.width('50%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('50%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('50%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Gray)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ wrap: FlexWrap.Wrap }) {
					Text('换行，每一行子元素按照主轴方向排列')
						.backgroundColor(Color.Red)
						.width('50%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('50%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('50%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Pink)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ wrap: FlexWrap.WrapReverse }) {
					Text('换行，每一行子元素按照主轴反方向排列')
						.backgroundColor(Color.Red)
						.width('50%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('50%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('50%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Gray)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ justifyContent: FlexAlign.Start }) {
					Text('子元素在主轴方向起始端对齐， 第一个子元素与父元素边沿对齐，其他元素与前一个元素对齐')
						.backgroundColor(Color.Red)
						.width('20%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('20%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('20%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Pink)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Flex({ justifyContent: FlexAlign.Center }) {
					Text('FlexAlign.Center：子元素在主轴方向居中对齐')
						.backgroundColor(Color.Red)
						.width('20%')
						.height(40)
					Text('item 1').backgroundColor(Color.Blue).width('20%').height(40)
					Text('item 2').backgroundColor(Color.Green).width('20%').height(40)

				}
				.height(70)
				.width('90%')
				.padding(5)
				.backgroundColor(Color.Pink)

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