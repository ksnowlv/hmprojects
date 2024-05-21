@Entry
@Component
struct NavigationPage {
	private itemList: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];

	@Builder navigationTitle() {
		Column() {
			Text('路由导航')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildList() {
		List({ space: 20 }) {
			ForEach(this.itemList, (item: string) => {
				ListItem() {
					NavRouter() {
						Text("NavRouter_" + item)
							.width("100%")
							.height(72)
							.backgroundColor('#FFFFFF')
							.borderRadius(20)
							.fontSize(16)
							.fontWeight(500)
							.textAlign(TextAlign.Center)
						NavDestination() {
							Text("Nav_Content_" + item).fontColor(Color.White).fontSize(16)
						}
						.title("Nav_title_" + item).backgroundColor(Color.Green)
					}
				}
			}, (item: string): string => item)
		}
		.width("90%")
		.margin({ top: 12 })
	}

	build() {
		Column() {
			Navigation() {
				TextInput({ placeholder: 'search...' })
					.width("90%")
					.height(40)
					.backgroundColor('#FFFFFF')
				this.buildList()
			}
			.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)
			.mode(NavigationMode.Split)
			// .mode(NavigationMode.Stack)
			// .mode(NavigationMode.Auto)

		}
		.height('100%')
		.width('100%')
		.backgroundColor('#F1F3F5')
	}
}