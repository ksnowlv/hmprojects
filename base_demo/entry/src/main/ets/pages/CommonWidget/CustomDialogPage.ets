import BaseCustomDialog from '../CommonWidget/BaseCustomDialog'

@Entry
@Component
struct CustomDialogPage {
	dialogController: CustomDialogController

	@Builder
	navigationTitle() {
		Column() {
			Text('自定义弹窗')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		Button({ type: ButtonType.Normal, stateEffect: true }) {
			Row() {
				Image($r('app.media.icon')).width(40).height(40).margin({ left: 10, right: 10 })
				Text('显示自定义对话框').fontSize(28).fontColor(0xffffff)
			}
			.alignItems(VerticalAlign.Center)

		}
		.margin({ top: 10, bottom: 10 })
		.borderRadius(8)
		.backgroundColor(0x317aff)
		.width('80%')
		.height(60)
		.onClick(() => {
			this.showDialog()
		})

	}

	showDialog() {
		this.dialogController = new CustomDialogController({
			builder: BaseCustomDialog({
				message: '我是自定义对话框的消息',
				cancel: () => {
					this.onCancel()
				},
				confirm: () => {
					this.onAccept()
				},
				controller: this.dialogController
			}),
		})


		this.dialogController.open()
	}

	onCancel() {
		console.info('Callback when the first button is clicked')
	}

	onAccept() {
		console.info('Callback when the second button is clicked')
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