import util from '@ohos.util';

class Contact {
	key: string = util.generateRandomUUID(true);
	name: string;
	icon: Resource;

	constructor(name: string, icon: Resource) {
		this.name = name;
		this.icon = icon;
	}
}

class DividerTmp {
	strokeWidth: Length = 1
	startMargin: Length = 60
	endMargin: Length = 10
	color: ResourceColor = '#ffe9f0f0'

	constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
		this.strokeWidth = strokeWidth
		this.startMargin = startMargin
		this.endMargin = endMargin
		this.color = color
	}
}


@Entry
@Component
struct ContactsListPage {
	private contacts: Array<object> = [
		new Contact('小明', $r("app.media.app_icon")),
		new Contact('小红', $r("app.media.plugin")),
		new Contact('小李', $r("app.media.home")),
		new Contact('小黑', $r("app.media.mine")),
		new Contact('小白', $r("app.media.icon")),
		new Contact('小明', $r("app.media.app_icon")),
		new Contact('小红', $r("app.media.plugin")),
		new Contact('小李', $r("app.media.home")),
		new Contact('小黑', $r("app.media.mine")),
		new Contact('小白', $r("app.media.icon")),
		new Contact('小明', $r("app.media.app_icon")),
		new Contact('小红', $r("app.media.plugin")),
		new Contact('小李', $r("app.media.home")),
		new Contact('小黑', $r("app.media.mine")),
		new Contact('小白', $r("app.media.icon")),
		new Contact('小明', $r("app.media.app_icon")),
		new Contact('小红', $r("app.media.plugin")),
		new Contact('小李', $r("app.media.home")),
		new Contact('小黑', $r("app.media.mine")),
		new Contact('小白', $r("app.media.icon")),
	]
	@State listDivider: DividerTmp = new DividerTmp(3, 60, 10, Color.Orange)

	@Builder navigationTitle() {
		Column() {
			Text('联系人列表')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder itemHead(text: string) {
		// 列表分组的头部组件，对应联系人分组A、B等位置的组件
		Text(text)
			.fontSize(20)
			.backgroundColor('#fff1f3f5')
			.width('100%')
			.padding(5)
	}

	build() {
		Navigation() {
			List({ space: 10 }) {
				ForEach(this.contacts, (item: Contact, index?: number) => {
					ListItem() {
						Row() {
							Image(item.icon)
								.width(40)
								.height(40)
								.margin(10)
							Text(index + "." + item.name).fontSize(20)
						}
						.width('100%')
						.justifyContent(FlexAlign.Start)
					}
				}, (item: Contact) => item.key.toString())
			}
			.width('100%')
			.backgroundColor('#FFF1F3F5')
			.divider(this.listDivider)
			.scrollBar(BarState.Auto)

		}
		.title(this.navigationTitle())
		.titleMode(NavigationTitleMode.Mini)

	}
}