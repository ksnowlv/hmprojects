import mediaquery from '@ohos.mediaquery';
import featureAbility from '@ohos.ability.featureAbility';

@Entry
@Component
struct MediaQueryPage {
	@State color: string = '#DB7093';
	@State text: string = 'Portrait';
	@State portraitFunc: mediaquery.MediaQueryResult | void | null = null;
	listener: mediaquery.MediaQueryListener = mediaquery.matchMediaSync('(orientation: landscape)'); // 当设备横屏时条件成立


	@Builder navigationTitle() {
		Column() {
			Text('媒体查询')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	onPortrait(mediaQueryResult: mediaquery.MediaQueryResult) { // 当满足媒体查询条件时，触发回调
		if (mediaQueryResult.matches as boolean) { // 若设备为横屏状态，更改相应的页面布局
			this.color = '#FFD700';
			this.text = 'Landscape';
		} else {
			this.color = '#DB7093';
			this.text = 'Portrait';
		}
	}

	aboutToAppear() {
		// 绑定当前应用实例
		this.listener.on('change', (mediaQueryResult: mediaquery.MediaQueryResult) => {
			this.onPortrait(mediaQueryResult)
		}); //绑定回调函数
	}

	@Builder buildPage() {

		Column({ space: 50 }) {
			Text(this.text).fontSize(50).fontColor(this.color)
			Text('Landscape').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
				.onClick(() => {
					let context = featureAbility.getContext();
					context.setDisplayOrientation(0); //调用该接口手动改变设备横竖屏状态
				})
			Text('Portrait').fontSize(50).fontColor(this.color).backgroundColor(Color.Orange)
				.onClick(() => {
					let context = featureAbility.getContext();
					context.setDisplayOrientation(1); //调用该接口手动改变设备横竖屏状态
				})
		}
		.width('100%').height('100%')

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