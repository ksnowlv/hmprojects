import router from '@ohos.router';

@Entry
@Component
struct VideoPage {
	TAG = 'VideoPage'
	localVideoController: VideoController = new VideoController()
	netVideoController: VideoController = new VideoController()
	localVideo: Resource = $rawfile('test.mp4')
	videoUrl = 'https://cmsvideo4.pg0.cn/group4/M00/13/0B/CgoN4mDdkX6AUcEYAESOlJKkmcM401.mp4'
	@State currentTime: number = 0;
	@State durationTime: number = 0;

	@Builder
	navigationTitle() {
		Column() {
			Text('视频播放')
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
					Video({
						src: this.localVideo,
						controller: this.localVideoController
					}).autoPlay(true)
						.width('90%')
						.height(200)

					Button('开始播放')
						.onClick((event) => {
							console.info(`${this.TAG}  onClick `)
							this.localVideoController.start();
						})
						.width('80%')

					Video({
						src: this.videoUrl,
						controller: this.netVideoController
					})
						.muted(false)//设置是否静音
						.controls(true)//设置是否显示默认控制条
						.autoPlay(false)//设置是否自动播放
						.loop(false)//设置是否循环播放
						.objectFit(ImageFit.Contain)//设置视频适配模式
						.width('90%')
						.height(200)
						.onPrepared((event) => {
							if (event) {
								console.info(`${this.TAG} onSeeked duration:${event.duration}`)
								this.durationTime = event.duration
							}
						})
						.onStart(() => {
							console.info(`${this.TAG} onStart `)
						})
						.onSeeked((event) => {
							if (event) {
								console.info(`${this.TAG}  onSeeked time:${event.time}`)
							}
						})
						.onUpdate((event) => {
							if (event) {
								console.info(`${this.TAG}  onUpdate time:${event.time}`)
								this.currentTime = event.time
							}
						})
						.onPause(() => {
							console.info(`${this.TAG}  onPause `)
						})
						.onFinish(() => {
							console.info(`${this.TAG}  onFinish `)
						})
						.onError(() => {
							console.info(`${this.TAG}  onError `)
						})

					Row() {
						Text(JSON.stringify(this.currentTime) + 's')
						Slider({
							value: this.currentTime,
							min: 0,
							max: this.durationTime
						})
							.onChange((value: number, mode: SliderChangeMode) => {
								this.netVideoController.setCurrentTime(value);
							}).width("80%")
						Text(JSON.stringify(this.durationTime) + 's')
					}.alignItems(VerticalAlign.Center)
					.justifyContent(FlexAlign.Center)
					.opacity(0.8)
					.width("90%")

					Button('开始播放')
						.onClick((event) => {
							console.info(`${this.TAG}  onClick `)
							this.netVideoController.start();
						})
						.width('80%')

					Button('播放视频')
						.onClick((event) => {
							router.pushUrl({
								url: 'pages/CommonWidget/FullPage',
								params: { videoSrc: this.videoUrl, videoTime: this.currentTime }
							})
						})
						.width('80%')

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