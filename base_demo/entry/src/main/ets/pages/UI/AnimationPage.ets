import curves from '@ohos.curves'

@Entry
@Component
struct AnimationPage {
	@State animate: boolean = false;
	// 第一步: 声明相关状态变量
	@State rotateValue: number = 0; // 组件一旋转角度
	@State translateX: number = 0; // 组件二偏移量
	@State scaleX: number = 1; // 组件三缩放
	@State scaleY: number = 1; // 组件三缩放
	@State opacityValue: number = 1; // 组件二透明度

	@Builder
	navigationTitle() {
		Column() {
			Text('动画')
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


					Text('通过可动画属性改变引起UI上产生的连续视觉效果，即为属性动画。属性动画是最基础易懂的动画，ArkUI提供两种属性动画接口animateTo和animation驱动组件属性按照动画曲线等动画参数进行连续的变化，产生属性动画')
						.width('80%')
					Column() {
						Text('ArkUI')
							.fontSize(25)
							.fontColor(Color.White)
					}
					.justifyContent(FlexAlign.Center)
					.width(100)
					.height(100)
					.borderRadius(10)
					.rotate({ angle: this.rotateValue })
					.backgroundColor(Color.Green)

					Column() {
						Text('ArkUI')
							.fontSize(25)
							.fontColor(Color.White)

					}
					.justifyContent(FlexAlign.Center)
					.width(100)
					.height(100)
					.backgroundColor(Color.Red)
					.borderRadius(10)
					.opacity(this.opacityValue)
					.translate({ x: this.translateX })

					Column() {
						Text('ArkUI')
							.fontSize(25)
							.fontColor(Color.White)

					}
					.justifyContent(FlexAlign.Center)
					.width(100)
					.height(100)
					.backgroundColor(Color.Blue)
					.borderRadius(10)
					.scale({ x: this.scaleX, y: this.scaleY })

					Button('测试属性动画')
						.margin({ top: 50 })
						.onClick(() => {
							this.handleStartAimationEvent()
						})

				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}

		}.width('100%')
		.height('100%')
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

	handleStartAimationEvent() {
		this.animate = !this.animate;
		// 第三步：通过属性动画接口开启属性动画
		animateTo({ curve: curves.springMotion() }, () => {
			// 第四步：闭包内通过状态变量改变UI界面
			// 这里可以写任何能改变UI的逻辑比如数组添加，显隐控制，系统会检测改变后的UI界面与之前的UI界面的差异，对有差异的部分添加动画
			// 组件一的rotate属性发生变化，所以会给组件一添加rotate旋转动画
			this.rotateValue = this.animate ? 180 : 0
			// 组件二的scale属性发生变化，所以会给组件二添加scale缩放动画
			this.opacityValue = this.animate ? 0.2 : 1
			// 组件二的offset属性发生变化，所以会给组件二添加offset偏移动画
			this.translateX = this.animate ? -100 : 100
			this.scaleX = this.animate ? 2 : 0.25
			this.scaleY = this.animate ? 2 : 0.25
		})
	}
}