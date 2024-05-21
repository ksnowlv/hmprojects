import HomePage from './HomePage'

@Entry
@Component
struct MainPage {
	@State private selectedIndex: number = 0;
	private controller: TabsController = new TabsController()

	build() {
		Column() {
			Tabs({ barPosition: BarPosition.End, controller: this.controller }) {
				TabContent() {
					HomePage().width('100%').height('100%').backgroundColor(Color.White)
				}.tabBar({
					icon: $r('app.media.home'),
					text: '首页'
				})

				TabContent() {

				}.tabBar({
					icon: $r('app.media.plugin'),
					text: '插件'
				})

				TabContent() {

				}
				.tabBar({
					icon: $r('app.media.mine'),
					text: '我的'
				})
			}
			.barWidth('100%') // 设置TabBar宽度
			.barHeight(60) // 设置TabBar高度
			.width('100%') // 设置Tabs组件宽度
			.height('100%') // 设置Tabs组件高度
			.backgroundColor(0xffADD8E6) // 设置Tabs组件背景颜色
			.onChange((index: number) => {
				this.selectedIndex = index;
			}
			)
		}
		.width('100%')
		.height('100%')

	}

	switchTab(type: number) {
		this.controller.changeIndex(3);
	}
}
