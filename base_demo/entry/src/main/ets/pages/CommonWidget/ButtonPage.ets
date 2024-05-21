@Entry
@Component
struct ButtonPage {
	@Builder navigationTitle() {
		Column() {
			Text('常用组件')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder buildButtons() {
		Button('Ok', { type: ButtonType.Normal, stateEffect: true })
			.borderRadius(8)
			.backgroundColor(0x317aff)
			.width(90)
			.height(40)
			.margin({ top: 10, bottom: 10 })


		Button({ type: ButtonType.Normal, stateEffect: true }) {
			Row() {
				Image($r('app.media.icon')).width(20).height(40).margin({ left: 12 })
				Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
			}.alignItems(VerticalAlign.Center)
		}
		.margin({ bottom: 10 })
		.borderRadius(8)
		.backgroundColor(0x317aff)
		.width(100)
		.height(50)
		.onClick(() => {
			let type = 'button'
			console.info(`${type}`);
		})

		Text('Button有三种可选类型，分别为胶囊类型（Capsule）、圆形按钮（Circle）和普通按钮（Normal），通过type进行设置')
			.margin({ top: 10, bottom: 10 })

	}

	build() {
		Column() {
			Navigation() {
				this.buildButtons()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)

		}.width('100%')
		.height('100%')
	}
}