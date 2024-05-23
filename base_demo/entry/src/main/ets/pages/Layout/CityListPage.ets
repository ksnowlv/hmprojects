@Entry
@Component
struct CityListPage {
	private cityList = ['北京', '天津', '上海', '深圳', '珠海', '厦门', '青岛', '大连', '威海']

	@Builder navigationTitle() {
		Column() {
			Text('城市')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	build() {
		Navigation() {
			List() {
				ForEach(this.cityList, (item) => {
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
		.title(this.navigationTitle())
		.titleMode(NavigationTitleMode.Mini)

	}
}