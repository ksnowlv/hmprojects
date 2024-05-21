import router from '@ohos.router'

@Entry
@Component
struct RouterNavigationContainerPage {
	private itemList = ["页面路由",
		"组件导航Navigation",
		"组件导航Tabs",
	]

	@Builder navigationTitle() {
		Column() {
			Text('鸿蒙课程')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildList() {
		if (this.itemList.length == 0) {
			Text("list have no data").fontSize(20).width('100%')
		} else {
			List() {
				ForEach(this.itemList, (value) => {
					ListItem() {
						Button(value, { type: ButtonType.Normal, stateEffect: true })
							.borderRadius(10)
							.backgroundColor(0xff31abff)
							.width('70%')
							.height(30)
							.align(Alignment.Center)
							.onClick(() => {
								console.info(`您进入${value}部分学习`);
								this.handleButtonEvent(value)

							})
					}
					.width('100%')
					.height(40)
				})
			}
			.alignListItem(ListItemAlign.Start)
		}
	}

	build() {
		Column() {
			Navigation() {
				this.buildList()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)

		}.backgroundColor(Color.White)
	}

	handleButtonEvent(item: string) {

		let url: string = ''

		switch (item) {
			case "页面路由":
				url = 'pages/UIContainerPage'
				break

			case "组件导航Navigation":
				url = 'pages/RouterNavigationPage/NavigationPage'
				break;

			case "组件导航Tabs":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			default:
				console.error(`No page found for item: ${item}`)
				return // 如果没有匹配的item，直接返回不执行路由跳转
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