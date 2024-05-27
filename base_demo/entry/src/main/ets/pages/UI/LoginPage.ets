@Entry
@Component
struct LoginPage {
	TAG = 'LoginPage'
	@State userAccount: string = ''
	@State password: string = ''

	@Builder
	navigationTitle() {
		Column() {
			Text('登陆')

				.fontColor('#182431')
				.fontSize(25)
				.lineHeight(41)
				.fontWeight(700)
		}
	}

	build() {
		Column() {
			Navigation() {
				this.buildPage()
			}.title(this.navigationTitle())
			.titleMode(NavigationTitleMode.Mini)

		}.width('100%')
		.height('100%')
	}

	@Builder
	buildPage() {
		Column() {
			Image($rawfile('login/app_logo.png'))
				.width(100)
				.height(100)
				.margin({ top: 20, bottom: 20 })
			Text('测试APP')
				.fontSize(24)
				.fontColor('#FFBECEFA')

			Row() {
				Image($rawfile('login/account.png'))
					.width(30)
					.height(30)
				TextInput({ placeholder: '请输入账户名', })//
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Transparent)
					.placeholderColor('#ffA0ACD4')
					.fontColor('#ffA0ACD4')
					.fontSize(20)
					.borderColor(Color.Transparent)
					.onFocus(() => {
						console.info(this.TAG + '-账号输入框获取焦点')
					})
					.onChange((value: string) => {
						this.userAccount = value
						console.info(this.TAG + '-账号:' + this.userAccount)
					})
					.onSubmit((enterKey: EnterKeyType) => {
						console.info(this.TAG + '-输入法回车键的类型值:' + enterKey)
					})

			}
			.height(50)
			.width('90%')
			.padding({ left: 10, right: 40 })
			.margin({ top: 40 })
			.backgroundColor('#FFF0F5FD')

			Row() {
				Image($rawfile('login/password.png'))
					.width(30)
					.height(30)
				TextInput({ placeholder: '请输入密码', })//
					.type(InputType.Password)
					.width('100%')
					.height('100%')
					.backgroundColor(Color.Transparent)
					.placeholderColor('#ffA0ACD4')
					.fontColor('#ffA0ACD4')
					.fontSize(20)
					.onFocus(() => {
						console.info(this.TAG + '-密码输入框获取焦点')
					})
					.onChange((value: string) => {
						this.password = value
						console.info(this.TAG + '-密码:' + this.password)
					})
					.onSubmit((enterKey: EnterKeyType) => {
						console.info(this.TAG + '-输入法回车键的类型值:' + enterKey)
					})
			}
			.height(50)
			.width('90%')
			.padding({ left: 10, right: 40 })
			.margin({ top: 10 })
			.backgroundColor('#FFF0F5FD')

			Button('登陆')
				.width('70%')
				.height(40)
				.margin({ top: 40 })
				.backgroundColor('#ff5B70CF')
				.fontColor(Color.White)
				.onClick(() => {
					console.info(this.TAG + '-触发登陆事件')
				})

			Button('注册')
				.width('70%')
				.height(40)
				.margin({ top: 15 })
				.backgroundColor('#ffF8644E')
				.fontColor(Color.White)
				.onClick(() => {
					console.info(this.TAG + '-触发注册事件')
				})

			Text('其他方式登录')
				.fontColor('#FFD5DFF2')
				.fontSize(13)
				.margin({ top: 30 })

			Row({ space: 10 }) {
				Image($rawfile('login/wechat.png'))
					.width(30)
					.height(30)
					.onClick(() => {
						console.info(this.TAG + '-触发微信分享事件')
					})
				Image($rawfile('login/qq.png'))
					.width(30)
					.height(30)
					.onClick(() => {
						console.info(this.TAG + '-触发QQ分享事件')
					})
				Image($rawfile('login/weibo.png'))
					.width(30)
					.height(30)
					.onClick(() => {
						console.info(this.TAG + '-触发微博分享事件')
					})
			}
			.margin({ top: 20 })

		}
		.width('100%')
		.height('100%')

	}
}