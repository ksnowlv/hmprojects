import router from '@ohos.router'
import HashMap from '@ohos.util.HashMap'


enum LayoutContainerPageType {
	LayoutContainerPageTypeRowColumn = 0, //线性布局(Row/Column)
	LayoutContainerPageTypeStack = 1, //层叠布局
	LayoutContainerPageTypeFlex = 2, //弹性布局(Flex)
	LayoutContainerPageTypeRelativeContainer = 3, //相对布局
	LayoutContainerPageTypeGridRow = 4, //栅格布局
	LayoutContainerPageTypeMediaquery = 5, //媒体查询
	LayoutContainerPageTypeList = 6, //创建列表
	LayoutContainerPageTypeGrid = 7, //创建网格
	LayoutContainerPageTypeSwiper = 8, //创建轮播
}

@Entry
@Component
struct LayoutContainerPage {
	TAG: string = 'LayoutContainerPage'
	private itemList = [
		"线性布局(Row/Column)",
		"层叠布局(Stack)",
		"弹性布局(Flex)",
		"相对布局(RelativeContainer)",
		"栅格布局(GridRow/GridCol)",
		"媒体查询(mediaquery)",
		"创建列表(List)",
		"创建网格(Grid/GridItem)",
		"创建轮播(Swiper)",
	]
	private typeList = [
	LayoutContainerPageType.LayoutContainerPageTypeRowColumn,
	LayoutContainerPageType.LayoutContainerPageTypeStack,
	LayoutContainerPageType.LayoutContainerPageTypeFlex,
	LayoutContainerPageType.LayoutContainerPageTypeRelativeContainer,
	LayoutContainerPageType.LayoutContainerPageTypeGridRow,
	LayoutContainerPageType.LayoutContainerPageTypeMediaquery,
	LayoutContainerPageType.LayoutContainerPageTypeList,
	LayoutContainerPageType.LayoutContainerPageTypeGrid,
	LayoutContainerPageType.LayoutContainerPageTypeSwiper,
	]
	private hashMap = new HashMap<String, LayoutContainerPageType>()

	@Builder navigationTitle() {
		Column() {
			Text('构建布局')
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

	aboutToAppear() {
		this.initializeHashMap();
		console.log(`${this.TAG}  create ${this.typeList.toString()}`)
	}

	private initializeHashMap() {
		this.typeList.forEach((type, index) => {
			this.hashMap.set(this.itemList[index], type);
		});
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
		const type = this.hashMap.get(item)

		switch (type) {
			case LayoutContainerPageType.LayoutContainerPageTypeRowColumn:
				url = 'pages/Layout/RowColumnPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeStack:
				url = 'pages/RouterNavigationPage/NavigationPage'
				break;

			case LayoutContainerPageType.LayoutContainerPageTypeFlex:
				url = 'pages/RouterNavigationPage/TabsPage'
				break
			case LayoutContainerPageType.LayoutContainerPageTypeRelativeContainer:
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeGridRow:
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeMediaquery:
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeList:
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeGrid:
				url = 'pages/RouterNavigationPage/TabsPage'
				break

			case LayoutContainerPageType.LayoutContainerPageTypeSwiper:
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