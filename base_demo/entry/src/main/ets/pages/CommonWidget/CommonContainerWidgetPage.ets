import router from '@ohos.router'

@Entry
@Component
struct CommonContainerWidgetPage {
	private itemList = [
		"按钮",
		"单选框",
		"切换按钮",
		"进度条",
		"文本显示",
		"文本输入",
		"自定义弹框",
		"视频播放",
		"XComponent",
	]

	@Builder navigationTitle() {
		Column() {
			Text('常用组件')
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
							.height(40)
							.align(Alignment.Center)
							.onClick(() => {
								this.handleButtonEvent(value)
							})
					}
					.width('100%')
					.height(50)
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
			case "按钮":
				url = 'pages/CommonWidget/ButtonPage'
				break

			case "单选框":
				url = 'pages/RouterNavigationPage/NavigationPage'
				break;

			case "切换按钮":
				url = 'pages/RouterNavigationPage/TabsPage'
				break
			case "进度条":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case "文本显示":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case "文本输入":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case "自定义弹框":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case "视频播放":
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case "XComponent":
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