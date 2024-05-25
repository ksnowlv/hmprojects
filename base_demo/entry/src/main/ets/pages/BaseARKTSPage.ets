import router from '@ohos.router'

@Entry
@Component
struct BaseARKTSPage {
	@Builder
	navigationTitle() {
		Column() {
			Text('ARKTS基础类库')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {
		List() {

			ListItem() {

				Column({ space: 30 }) {

					Button('并发编程')
						.width('80%')
						.onClick(() => {
							router.pushUrl({ url: 'pages/BaseArkTS/ConcurrencyPage' })
						})

					Button('类似STL的容器类库')
						.width('80%')
						.onClick(() => {
							router.pushUrl({ url: 'pages/BaseArkTS/STLPage' })
						})

					Button('XML的生成，解析，转换')
						.width('80%')
						.onClick(() => {
							router.pushUrl({ url: 'pages/BaseArkTS/XMLPage' })
						})


				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}
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