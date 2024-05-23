@Entry
@Component
struct ProgressPage {
	@State progressValue0: number = 0 // 设置进度条初始值为0
	@State progressValue1: number = 0 // 设置进度条初始值为0
	@State progressValue2: number = 0 // 设置进度条初始值为0
	@State progressValue: number = 0 // 设置进度条初始值为0

	@Builder
	navigationTitle() {
		Column() {
			Text('进度条')
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
					Text('Progress有5种可选类型，通过ProgressType可以设置进度条样式，ProgressType类型包括：ProgressType.Linear（线性样式）、 ProgressType.Ring（环形无刻度样式）、ProgressType.ScaleRing（环形有刻度样式）、ProgressType.Eclipse（圆形样式）和ProgressType.Capsule（胶囊样式）')

					Text('从API version9开始，组件高度大于宽度时，自适应垂直显示；组件高度等于宽度时，保持水平显示')

					Progress({ value: 0, total: 100, type: ProgressType.Linear })
						.width(200)
						.height(50)
						.value(this.progressValue0)
					Progress({ value: 0, total: 100, type: ProgressType.Linear })
						.width(50)
						.height(200)
						.value(this.progressValue0)

					Button("进度条+3")
						.onClick(() => {
							this.progressValue0 += 3
							if (this.progressValue0 > 100) {
								this.progressValue0 = 0
							}
						})


					Text('环形无刻度样式进度条')

					// 从左往右，1号环形进度条，默认前景色为蓝色渐变，默认strokeWidth进度条宽度为2.0vp
					Progress({ value: 0, total: 150, type: ProgressType.Ring })
						.width(100)
						.height(100)
						.value(this.progressValue1)

					// 从左往右，2号环形进度条
					Progress({ value: 0, total: 150, type: ProgressType.Ring })
						.width(100)
						.height(100)
						.color(Color.Green)// 进度条前景色为绿色
						.style({ strokeWidth: 10 })// 设置strokeWidth进度条宽度为10.0vp
						.value(this.progressValue1)

					Button("进度条+4")
						.onClick(() => {
							this.progressValue1 += 4
							if (this.progressValue1 > 100) {
								this.progressValue1 = 0
							}
						})


					Text('环形有刻度样式进度条')

					Progress({ value: 10, total: 200, type: ProgressType.ScaleRing }).width('60%')
						.backgroundColor(Color.Red)
						.style({ scaleCount: 20, scaleWidth: 5 })// 设置环形有刻度进度条总刻度数为20，刻度宽度为5vp
						.value(this.progressValue2)

					Progress({ value: 15, total: 200, type: ProgressType.ScaleRing }).width('60%')
						.backgroundColor(Color.Blue)
						.style({ strokeWidth: 5, scaleCount: 20, scaleWidth: 5 })// 设置环形有刻度进度条宽度5，总刻度数为20，刻度宽度为5vp
						.value(this.progressValue2)

					Progress({ value: 20, total: 200, type: ProgressType.ScaleRing }).width('60%')
						.backgroundColor(Color.Green)
						.style({ strokeWidth: 10, scaleCount: 20, scaleWidth: 2 })// 设置环形有刻度进度条宽度10，总刻度数为20，刻度宽度为2vp
						.value(this.progressValue2)

					Button("进度条+5")
						.onClick(() => {
							this.progressValue2 += 5
							if (this.progressValue2 > 100) {
								this.progressValue2 = 0
							}
						})
					Text('胶囊样式进度条')

					Progress({ value: 0, total: 150, type: ProgressType.Capsule })
						.width(200)
						.height(50)
						.value(this.progressValue)

					Progress({ value: 0, total: 150, type: ProgressType.Capsule })
						.width(50)
						.height(200)
						.color(Color.Green)
						.value(this.progressValue)

					Progress({ value: 0, total: 150, type: ProgressType.Capsule })
						.width(50)
						.height(200)
						.color(Color.Blue)
						.backgroundColor(Color.Green)
						.value(this.progressValue)

					Button("进度条+6")
						.onClick(() => {
							this.progressValue += 6
							if (this.progressValue > 100) {
								this.progressValue = 0
							}
						})


				}.width('100%')
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