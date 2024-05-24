@Entry
@Component
struct PopupMenuPage {
	@State popupFlag: boolean = false
	@State popupWithButtonsFlag: boolean = false
	@State customPopupFlag: boolean = false
	menuList = ['微信好友', '微信朋友圈', 'QQ好友', '微博', '保存到相册']

	@Builder
	navigationTitle() {
		Column() {
			Text('菜单和气泡')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPopup() {
		Row({ space: 3 }) {
			Image($r("app.media.icon")).width(30).height(30).margin({ left: 10 })
			Text('This is Custom Popup').fontSize(15)
		}.width(200).height(50).padding(5)
	}

	@Builder
	buildSubMenu() {
		Menu() {
			MenuItem({ content: "复制", labelInfo: "Ctrl+C" })
			MenuItem({ content: "粘贴", labelInfo: "Ctrl+V" })
		}
	}

	@Builder
	buildMenu() {
		Menu() {
			ForEach(this.menuList, (item) => {
				MenuItem({ startIcon: $r('app.media.app_icon'), content: item })
			})

			MenuItem({
				startIcon: $r("app.media.icon"),
				content: '编辑',
				endIcon: $r('app.media.app_icon'),
				builder: this.buildSubMenu.bind(this)//直接this.buildSubMenu()子菜单显示在父菜单上。当前这种方式在模块器上，我是没有见过子菜单

			}) //.bindMenu(this.buildSubMenu())这倒是可以显示出菜单，但是，原来的菜单消失了
		}
	}

	@Builder
	buildPage() {
		List() {

			ListItem() {

				Column({ space: 10 }) {
					Text('在Button组件上绑定Popup属性，每次点击Button按钮，handlePopup会切换布尔值，当值为true时，触发bindPopup弹出气泡')
					Button('普通的气泡')
						.onClick(() => {
							this.popupFlag = !this.popupFlag
						})
						.bindPopup(this.popupFlag, {
							message: 'This is a popup with PopupOptions',

							onStateChange: (e) => {

								if (!e.isVisible) {
									this.popupFlag = false
								}
							}
						})

					Text('---带按钮的提示气泡:通过primaryButton、secondaryButton属性为气泡最多设置两个Button按钮，通过此按钮进行简单的交互，开发者可以通过配置action参数来设置想要触发的操作---')
					Button('带按钮的提示气泡').margin({ top: 20 })
						.onClick(() => {
							this.popupWithButtonsFlag = !this.popupWithButtonsFlag
						})
						.bindPopup(this.popupWithButtonsFlag, {
							message: '这是一个带按钮的气泡',
							primaryButton: {
								value: '确定',
								action: () => {
									this.popupWithButtonsFlag = !this.popupWithButtonsFlag
								}
							},
							secondaryButton: {
								value: '取消',
								action: () => {
									this.popupWithButtonsFlag = !this.popupWithButtonsFlag
								}
							},
							onStateChange: (e) => {
								if (!e.isVisible) {
									this.popupWithButtonsFlag = false
								}
							}
						})


					Button('自定义气泡')
						.onClick(() => {
							this.customPopupFlag = !this.customPopupFlag
						})
						.bindPopup(this.customPopupFlag, {
							builder: this.buildPopup(), // 气泡的内容
							placement: Placement.Bottom, // 气泡的弹出位置
							popupColor: Color.Pink, // 气泡的背景色
							onStateChange: (e) => {
								console.info(JSON.stringify(e.isVisible))
								if (!e.isVisible) {
									this.customPopupFlag = false
								}
							}
						})

					Text('---创建默认样式的菜单---')

					Button('点击弹出菜单')
						.bindMenu([
							{
								value: '打开',
								action: () => {
									console.info('点击了打开菜单')
								}
							},
							{
								value: '保存',
								action: () => {
									console.info('点击了保存菜单')
								}
							}
						])

					//无论如何尝试，在模拟器上，我没有看到子菜单显示。
					Button('显示自定义菜单')
						.bindMenu(this.buildMenu())

					Button('右键或长按的菜单')
						.bindContextMenu(this.buildMenu(), ResponseType.LongPress)


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