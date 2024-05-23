@Entry
@Component
struct TogglePage {
	@Builder
	navigationTitle() {
		Column() {
			Text('切换按钮')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		List() {
			ListItem() {

				Column({ space: 10 }) {

					Text('创建不包含子组件的Toggle。 当ToggleType为Checkbox或者Switch时，用于创建不包含子组件的Toggle')
					Toggle({ type: ToggleType.Checkbox, isOn: false })
					Toggle({ type: ToggleType.Checkbox, isOn: true })

					Toggle({ type: ToggleType.Switch, isOn: false })
					Toggle({ type: ToggleType.Switch, isOn: true })

					Text('创建包含子组件的Toggle。 当ToggleType为Button时，只能包含一个子组件，如果子组件有文本设置，则相应的文本内容会显示在按钮上')
					Toggle({ type: ToggleType.Button, isOn: false }) {
						Text('status button')
							.fontColor('#182431')
							.fontSize(12)
					}.width(100)

					Toggle({ type: ToggleType.Button, isOn: true }) {
						Text('status button')
							.fontColor('#182431')
							.fontSize(12)
					}.width(100)


					Text('通过selectedColor属性设置Toggle打开选中后的背景颜色')
					Toggle({ type: ToggleType.Button, isOn: true }) {
						Text('status button')
							.fontColor('#182431')
							.fontSize(12)
					}.width(100).selectedColor(Color.Pink)

					Toggle({ type: ToggleType.Checkbox, isOn: true })
						.selectedColor(Color.Pink)

					Toggle({ type: ToggleType.Switch, isOn: true })
						.selectedColor(Color.Pink)

					Text('通过switchPointColor属性设置Switch类型的圆形滑块颜色，仅对type为ToggleType.Switch生效。')

					Toggle({ type: ToggleType.Switch, isOn: false })
						.switchPointColor(Color.Pink)
					Toggle({ type: ToggleType.Switch, isOn: true })
						.switchPointColor(Color.Pink)

					Text('，Toggle还用于选中和取消选中后触发某些操作，可以绑定onChange事件来响应操作后的自定义行为')

					Toggle({ type: ToggleType.Switch, isOn: false })
						.onChange((isOn: boolean) => {
							if (isOn) {
								// 需要执行的操作
							}
						})

				}
				.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}

		}

	}

	build() {
		Column() {
			Navigation() {
				this.buildPage()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Full)

		}.width('100%')
		.height('100%')
	}
}