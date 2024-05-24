import router from '@ohos.router'


@Component
export default struct HomePage {
	private itemList = [
		"UI开发",
		"ARKTS语言基础类库",
		"通知",
		"媒体",
		"安全",
		"网络与连接",
		"电话服务",
		"数据管理",
		"文件管理",
		"后台任务",
		"设备管理",
		"DFX",
		"国际化和本地化",
		"应用服务",
		"一次开发，多端部署",
		"Native API(NDK)",
		"性能",
		"工具",
	]
	private pageMap: Map<string, string> = new Map<string, string>();

	constructor() {
		super();

	}

	@Builder
	navigationTitle() {
		Column() {
			Text('鸿蒙学习计划')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
			Text('按主题进行')
				.fontColor('#182431')
				.fontSize(14)
				.lineHeight(19)
				.opacity(0.4)
				.margin({ top: 2, bottom: 10 })
		}.alignItems(HorizontalAlign.Start)
	}

	build() {
		Column() {
			Navigation() {
				this.buildList()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Mini)

		}.backgroundColor(Color.White)

	}

	@Builder
	buildList() {
		List() {
			ForEach(this.itemList, (item: string) => {
				ListItem() {
					Button(item, { type: ButtonType.Normal, stateEffect: true })
						.borderRadius(10)
						.backgroundColor(0xff31abff)
						.width('70%')
						.height(40)
						.align(Alignment.Center)
						.onClick(() => {
							console.info("您进入{}部分学习", item)
							this.handleButtonEvent(item)
						})
				}
				.width('100%')
				.height(50)
			})
		}
		.alignListItem(ListItemAlign.Start)
	}

	handleButtonEvent(item: string) {
		let url: string = ''

		switch (item) {
			case "UI开发":
				url = 'pages/UIContainerPage'
				break;

			case "ARKTS语言基础类库":
				url = "pages/BaseARKTSPage"
				break
			case "通知":
				url = "pages/NotificationPage"
				break
			case "媒体":
				url = "pages/MediaPage"
				break
			case "安全":
				url = "pages/BaseARKTSPage"
				break
			case "网络与连接":
				url = "pages/NetPage"
				break
			case "电话服务":
				url = "pages/PhoneServicePage"
				break
			case "数据管理":
				url = "pages/DataMgrPage"
				break
			case "文件管理":
				url = "pages/FileMgrPage"
				break
			case "后台任务":
				url = "pages/BackgroundTaskPage"
				break
			case "设备管理":
				url = "pages/DeviceMgrPage"
				break

			case "DFX":
				url = "pages/DFXPage"
				break

			default:
				console.error(`No page found for item: ${item}`)
				return; // 如果没有匹配的item，直接返回不执行路由跳转
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

