@Entry
@Component
struct TabsPage {
	@State private selectedIndex: number = 0;
	private controller: TabsController = new TabsController()
	private itemList = [
		"关注",
		"视频",
		"游戏",
		"数码",
		"科技",
		"影视",
		"体育",
	]

	build() {
		Column() {
			//BarPosition.Start
			//BarPosition.End
			Tabs({ barPosition: BarPosition.Start, controller: this.controller }) {

				ForEach(this.itemList, (item) => {
					TabContent() {
						Column() {
							Text(item)
								.fontSize(24)
								.fontColor(Color.White)
						}
						.width('100%')
						.height('100%') // 如果需要垂直居中，确保高度设置正确
						.alignItems(HorizontalAlign.Center) // 水平居中子组件
						.justifyContent(FlexAlign.Center) // 垂直居中子组件
						.backgroundColor(Color.Green)
					}
					.tabBar({
						text: item
					})

				})
			}
			// .vertical(true) //开启侧边导航栏
			// .barWidth(100) //开启侧边导航栏，设置barWidth
			// .barHeight(300) //开启侧边导航栏，设置barHeight
			.barWidth('100%') // 开启顶部/底部导航栏，设置TabBar宽度
			.barHeight(60) // 开启顶部/底部导航栏，设置TabBar高度
			.width('100%') // 设置Tabs组件宽度
			.height('100%') // 设置Tabs组件高度
			.backgroundColor(0xffADD8E6) // 设置Tabs组件背景颜色
			.onChange((index: number) => {
				this.selectedIndex = index;
				console.info(`${this.selectedIndex} `);
			}
			)

		}
		.width('100%')
		.height('100%')

	}
}