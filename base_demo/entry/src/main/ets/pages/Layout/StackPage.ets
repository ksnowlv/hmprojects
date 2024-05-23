@Entry
@Component
struct StackPage {
	@Builder navigationTitle() {
		Column() {
			Text('层叠布局')
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
					Stack({}) {
						Column() {
						}.width('90%').height('100%').backgroundColor('#ff58b87c')

						Text('text').width('60%').height('60%').backgroundColor('#ffc3f6aa')
						Button('button').width('30%').height('30%').backgroundColor('#ff8ff3eb').fontColor('#000')
					}.width('100%').height(150).margin({ top: 20 })
				}
			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.TopStart }) {
					Text('Stack TopStart')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.Top }) {
					Text('Stack Top')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.TopEnd }) {
					Text('Stack TopEnd')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.Start }) {
					Text('Stack Start')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.Center }) {
					Text('Stack Center')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.End }) {
					Text('Stack End')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.BottomStart }) {
					Text('Stack BottomStart')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.Bottom }) {
					Text('Stack Bottom')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Stack({ alignContent: Alignment.BottomEnd }) {
					Text('Stack BottomEnd')
						.width('90%')
						.height('100%')
						.backgroundColor(Color.Green)
						.align(Alignment.BottomEnd)
					Text('Item 1').width('70%').height('80%').backgroundColor(Color.Blue).align(Alignment.BottomEnd)
					Text('Item 2').width('50%').height('60%').backgroundColor(Color.Red).align(Alignment.BottomEnd)
				}.width('100%')
				.height(100)
				.margin({ top: 5 })
				.backgroundColor(Color.Black)

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