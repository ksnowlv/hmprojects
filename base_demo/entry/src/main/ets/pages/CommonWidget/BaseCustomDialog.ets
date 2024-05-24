@CustomDialog
export default struct BaseCustomDialog {
	message: string = ''
	cancel?: () => void
	confirm?: () => void
	controller: CustomDialogController

	build() {
		Column() {
			Text(this.message).fontSize(20).margin({ top: 20, bottom: 20 })

			Flex({ justifyContent: FlexAlign.SpaceAround }) {
				Button('取消')
					.onClick(() => {

						if (this.controller) {
							this.controller.close()
						}
						if (this.cancel) {
							this.cancel()
						}
					}).width('40%')
				Button('同意')
					.onClick(() => {
						if (this.controller) {
							this.controller.close()
						}

						if (this.confirm) {
							this.confirm()
						}
					}).width('40%')
			}.margin({ bottom: 10 })
		}
	}
}