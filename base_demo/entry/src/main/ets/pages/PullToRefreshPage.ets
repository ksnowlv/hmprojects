import { PullToRefresh } from '@ohos/pulltorefresh'

@Entry
@Component
struct PullToRefreshPage {
	@State itemList: string[] = ['北京', '天津', '上海', '深圳', '珠海', '厦门', '青岛', '大连', '威海', '烟台', '旅顺', '长春', '哈尔滨', '沈阳']
	private scroller: Scroller = new Scroller();

	@Builder
	navigationTitle() {
		Column() {
			Text('城市')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildList() {
		List() {
			ForEach(this.itemList, (item) => {
				ListItem() {
					Text(item).fontSize(24).fontColor(Color.Green)
				}
				.width('100%')
				.height('50')
				.margin({ top: 20 })
			})
		}
		.backgroundColor('#FFF1F3F5')
		.alignListItem(ListItemAlign.Center)

	}

	build() {
		Navigation() {

			PullToRefresh({
				// 必传项，列表组件所绑定的数据
				data: this.itemList,
				// 必传项，需绑定传入主体布局内的列表或宫格组件
				scroller: this.scroller,
				// 必传项，自定义主体布局，内部有列表或宫格组件
				customList: () => {
					this.buildList()
				},
				// 可选项，下拉刷新回调
				onRefresh: () => {
					return new Promise<string>((resolve, reject) => {
						// 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
						setTimeout(() => {
							resolve('刷新成功');
							//this.itemList = this.dataNumbers;
							const citys: string[] = ['郑州', '济南', '沈阳']
							this.itemList.concat(citys)
						}, 2000);
					});
				},
				// 可选项，上拉加载更多回调
				onLoadMore: () => {
					return new Promise<string>((resolve, reject) => {
						// 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
						setTimeout(() => {
							resolve('');
							//this.data.push("增加的条目" + this.data.length);
							this.itemList.push('武汉')
						}, 2000);
					});
				},
				customLoad: null,
				customRefresh: null,
			})

		}
		.title(this.navigationTitle())
		.titleMode(NavigationTitleMode.Mini)

	}
}