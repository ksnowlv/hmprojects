import promptAction from '@ohos.promptAction';

@Entry
@Component
struct RadioPage {
	@State Rst: promptAction.ShowToastOptions = { 'message': 'Ringing mode.' }
	@State Vst: promptAction.ShowToastOptions = { 'message': 'Vibration mode.' }
	@State Sst: promptAction.ShowToastOptions = { 'message': 'Silent mode.' }

	@Builder
	navigationTitle() {
		Column() {
			Text('单选框')
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
				Column() {
					Radio({ value: 'Radio1', group: 'radioGroup' }).checked(true)
						.height(50)
						.width(50)
						.onChange((isChecked: boolean) => {
							if (isChecked) {
								// 切换为响铃模式
								promptAction.showToast(this.Rst)
							}
						})
					Text('Ringing')

				}
				.width('100%')
				// .backgroundColor(Color.Green)
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)

			}
			.margin({ top: 10, bottom: 10 })

			ListItem() {
				Column() {
					Radio({ value: 'Radio2', group: 'radioGroup' })
						.height(50)
						.width(50)
						.onChange((isChecked: boolean) => {
							if (isChecked) {
								// 切换为振动模式
								promptAction.showToast(this.Vst)
							}
						})
					Text('Vibration')
				}
				.width('100%')
				// .backgroundColor(Color.Green)
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10 })

			ListItem() {
				Column() {
					Radio({ value: 'Radio3', group: 'radioGroup' })
						.height(50)
						.width(50)
						.onChange((isChecked: boolean) => {
							if (isChecked) {
								// 切换为静音模式
								promptAction.showToast(this.Sst)
							}
						})
					Text('Silent')
				}
				.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)

			}.margin({ top: 10, bottom: 10 })

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