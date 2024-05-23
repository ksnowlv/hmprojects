import router from '@ohos.router'

@Entry
@Component
struct ListPage {
	private itemList = ['城市列表', '联系人列表', '迭代列表', '自定义列表样式', '支持分组列表', '删除列表项']

	@Builder navigationTitle() {
		Column() {
			Text('列表')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildPage() {

		List() {

			ForEach(this.itemList, (item) => {

				ListItem() {
					Button(item, { type: ButtonType.Normal, stateEffect: true })
						.borderRadius(10)
						.backgroundColor(0xff31abff)
						.width('70%')
						.height(40)
						.align(Alignment.Center)
						.onClick(() => {

							this.handleButtonEvent(item)

						})
				}
				.width('100%')
				.height(80)
				.margin({ top: 10, bottom: 10 })

			})


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

	handleButtonEvent(item: String) {

		let url: string = ''

		switch (item) {
			case '城市列表':
				url = 'pages/Layout/CityListPage'

				break;
			case '联系人列表':
				url = 'pages/Layout/ContactsListPage'

				break;

			case '迭代列表':

				break;

			case '自定义列表样式':

				break;

			case '支持分组列表':

				break;

			case '删除列表项':

				break;

			default:
				break;
		}

		if (null == url) {
			return
		}


		router.pushUrl({ url: url }, router.RouterMode.Standard, (err) => {
			if (err) {
				console.error(`Invoke pushUrl failed, code is ${err.code}, message is ${err.message}`)
				return
			}
			console.info('Invoke pushUrl succeeded.')
		});

	}
}