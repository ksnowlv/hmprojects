@Entry
@Component
struct ButtonPage {
	@Builder
	navigationTitle() {
		Column() {
			Text('常用组件')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildButtons() {
		Button('Ok', { type: ButtonType.Normal, stateEffect: true })
			.borderRadius(8)
			.backgroundColor(0x317aff)
			.width('80%')
			.height(40)
			.margin({ top: 10 })


		Button({ type: ButtonType.Normal, stateEffect: true }) {
			Row() {
				Image($r('app.media.icon')).width(20).height(40).margin({ left: 12 })
				Text('loading').fontSize(12).fontColor(0xffffff).margin({ left: 5, right: 12 })
			}.alignItems(VerticalAlign.Center)
		}
		.borderRadius(8)
		.backgroundColor(0x317aff)
		.width('80%')
		.height(50)
		.onClick(() => {
			let type = 'button'
			console.info(`${type}`);
		})
		.margin({ top: 10 })

		Text('Button有三种可选类型，分别为胶囊类型（Capsule）、圆形按钮（Circle）和普通按钮（Normal），通过type进行设置')
			.width('90%')
			.margin({ top: 10 })

		Button('Disable', { type: ButtonType.Capsule, stateEffect: false })
			.backgroundColor(0x317aff)
			.width('80%')
			.height(40)
			.margin({ top: 10 })

		Button('圆形按钮Circle,不支持通过borderRadius属性重新设置圆角', { type: ButtonType.Circle, stateEffect: false })
			.backgroundColor(0x317aff)
			.width('80%')
			.height(200)
			.margin({ top: 10 })

		Button('普通按钮', { type: ButtonType.Normal, stateEffect: true })
			.borderRadius(8)
			.backgroundColor(0x317aff)
			.width('80%')
			.height(40)
			.margin({ top: 10 })

		Button('自定义样式-circle border', { type: ButtonType.Normal })
			.width('80%')
			.borderRadius(20)
			.height(40)
			.margin({ top: 10 })

		Button('自定义样式-font style', { type: ButtonType.Normal })
			.fontSize(20)
			.width('80%')
			.fontColor(Color.Pink)
			.fontWeight(800)
			.margin({ top: 10 })

		Button('自定义样式-background color')
			.backgroundColor(0xF55A42)
			.width('80%')
			.margin({ top: 10 })

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