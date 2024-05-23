// @ts-nocheck
import HashMap from '@ohos.util.HashMap'
import router from '@ohos.router'


enum UIContainerPageType {
	UIContainerPageTypeLayout = 0, //UI布局
	UIContainerPageTypeCommonWidget = 1, //组件-常用组件
	UIContainerPageTypeBubbleAndMenu = 2, //组件-气泡和菜单
	UIContainerPageTypeRouterNavigation = 3, //页面路由和组件导航
	UIContainerPageTypeShowShape = 4, //显示图形
	UIContainerPageTypeAnimation = 5, //使用动画
	UIContainerPageTypeEvent = 6, //使用交互事件
	UIContainerPageTypePullRefresh = 7, //下拉刷新组件
}


@Entry
@Component
struct UIContainerPage {
	TAG: string = 'UIContainerPage'
	private hashMap: HashMap<UIContainerPageType, string> = new HashMap<UIContainerPageType, string>()
	private itemList = ["UI布局",
		"组件-常用组件",
		"组件-气泡和菜单",
		"页面路由和组件导航",
		"显示图形",
		"使用动画",
		"使用交互事件",
		"下拉刷新组件",
	]

	@Builder
	navigationTitle() {
		Column() {
			Text('UI开发')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	constructor() {
		super()
		console.info(`${this.TAG} constructor`);
	}

	// 只有被@Entry装饰的组件才可以调用页面的生命周期
	onPageShow() {
		console.info(`${this.TAG} onPageShow`);
	}

	// 只有被@Entry装饰的组件才可以调用页面的生命周期
	onPageHide() {
		console.info(`${this.TAG} onPageHide`);
	}

	// 只有被@Entry装饰的组件才可以调用页面的生命周期
	onBackPress() {

		console.info(`${this.TAG} onBackPress`);
	}

	// 组件生命周期
	aboutToAppear() {
		console.info(`${this.TAG} aboutToAppear`);
		this.setupData()
	}

	// 组件生命周期
	aboutToDisappear() {
		console.info(`${this.TAG} aboutToDisappear`);
	}

	setupData() {
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeLayout, "UI布局")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeCommonWidget, "组件-常用组件")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeBubbleAndMenu, "组件-气泡和菜单")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeRouterNavigation, "页面路由和组件导航")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeShowShape, "显示图形")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeAnimation, "使用动画")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypeEvent, "使用交互事件")
		this.hashMap.set(UIContainerPageType.UIContainerPageTypePullRefresh, "下拉刷新组件")
		let res = this.hashMap.get(UIContainerPageType.UIContainerPageTypePullRefresh)
		console.info(`${res} aboutToDisappear`);

		this.hashMap.forEach((value: string, key: UIContainerPageType) => {
			console.info(`键：${key}, 值：${value}`);
		});

	}

	@Builder
	buildList() {

		if (this.itemList.length == 0) {
			Text("list have no data").fontSize(20).width('100%')
		} else {
			List() {
				// 使用ForEach遍历List
				ForEach(this.itemList, (value) => {
					ListItem() {
						Button(value, { type: ButtonType.Normal, stateEffect: true })
							.borderRadius(10)
							.backgroundColor(0xff31abff)
							.width('70%')
							.height(40)
							.align(Alignment.Center)
							.onClick(() => {
								console.info(`您进入${value}部分学习`);
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
			case "UI布局":
				url = 'pages/Layout/LayoutContainerPage'
				break

			case "组件-常用组件":
				url = 'pages/CommonWidget/CommonContainerWidgetPage'
				break;

			case "组件-气泡和菜单":
				break

			case "页面路由和组件导航":
				url = "pages/RouterNavigationPage/RouterNavigationContainerPage"
				break

			case "显示图形":
				url = "pages/NavigationExample"
				break

			case "使用动画":
				url = "pages/NavigationExample"
				break

			case "使用交互事件":
				url = "pages/NavigationExample"
				break

			case "下拉刷新组件":
				url = "pages/PullToRefreshPage"
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