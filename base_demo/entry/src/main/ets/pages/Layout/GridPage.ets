@Entry
@Component
struct GridPage {
	@State citys: string[] = ['北京', '天津', '上海', '厦门', '深圳', '昆明', '桂林', '张家界', '珠海']
	@State services: string[] = ['外卖', '酒店', '游戏', '旅游', '电影', '直播', '门票', '充值', '城市服务']

	@Builder
	navigationTitle() {
		Column() {
			Text('网格')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		Column({ space: 5 }) {
			Text('---城市----')
			Grid() {
				ForEach(this.citys, (city: string, index) => {
					GridItem() {
						Text(index + "." + city)
							.fontSize(20)
							.fontColor(Color.White)
					}.backgroundColor(Color.Black)

				}, (city: string): string => city)
			}
			.rowsTemplate('1fr 1fr 1fr')
			.columnsTemplate("1fr 2fr 2fr")
			.columnsGap(10)
			.rowsGap(15)
			.height(150)

			Text('---服务----')

			Grid() {
				ForEach(this.services, (service: string, index) => {
					GridItem() {
						Text(index + "." + service)
							.fontSize(20)
							.fontColor(Color.Green)
					}.backgroundColor(Color.Orange)
					.width('40%')

				}, (service: string): string => service)
			}
			.rowsTemplate('1fr 1fr') // 只设置rowsTemplate属性，当内容超出Grid区域时，可水平滚动。
			.rowsGap(15)
			.columnsGap(15)
			.height(100)

		}

		// List() {
		// 	ListItem() {
		// 		Column() {
		// 			Grid() {
		// 				ForEach(this.services, (item) => {
		// 					GridItem() {
		// 						Text(item).fontSize(24)
		// 					}
		// 				})
		// 			}.rowsTemplate('1fr 1fr')
		// 			.columnsTemplate('1fr 1fr')
		// 			.columnsGap(10)
		// 			.rowsGap(20)
		// 		}
		// 	}.margin({ top: 10, bottom: 10 })
		//
		// 	ListItem() {
		// 		Stack({ alignContent: Alignment.TopStart }) {
		// 			Text('Stack').width('90%').height('100%').backgroundColor('#e1dede').align(Alignment.BottomEnd)
		// 			Text('Item 1').width('70%').height('80%').backgroundColor(0xd2cab3).align(Alignment.BottomEnd)
		// 			Text('Item 2').width('50%').height('60%').backgroundColor(0xc1cbac).align(Alignment.BottomEnd)
		// 		}.width('100%')
		// 		.height(150)
		// 		.margin({ top: 5 })
		// 		.backgroundColor(Color.Black)
		//
		// 	}.margin({ top: 10, bottom: 10 })
		//
		// }
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