@Entry
@Component
struct SwiperPage {
	private swiperController: SwiperController = new SwiperController()
	private itemList = ['我是第1页', '我是第2页', '我是第3页面', '我是第4页', '我是第5页', '我是第6页', '我是第7页']

	@Builder
	navigationTitle() {
		Column() {
			Text('轮播')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		Column({ space: 5 }) {
			Swiper(this.swiperController) {

				ForEach(this.itemList, (item, index) => {

					if (index % 3 == 0) {
						Text(item)
							.backgroundColor(Color.Red)
							.textAlign(TextAlign.Center)
							.fontSize(30)
					} else if (index % 3 == 1) {
						Text(item)
							.backgroundColor(Color.Green)
							.textAlign(TextAlign.Center)
							.fontSize(30)
					} else {
						Text(item)
							.backgroundColor(Color.Blue)
							.textAlign(TextAlign.Center)
							.fontSize(30)
					}
				})
			}
			.width('90%')
			.height(300)
			.indicator(true)
			.autoPlay(true)
			.interval(1000)

			Row({ space: 50 }) {
				Button('显示下一页')
					.onClick(() => {
						this.swiperController.showNext(); // 通过controller切换到后一页
					})
				Button('显示上一页')
					.onClick(() => {
						this.swiperController.showPrevious(); // 通过controller切换到前一页
					})
			}.margin(5)
		}
		.width('100%')
		.margin({ top: 5 })

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