import router from '@ohos.router'
import { DataModel, UserModel } from '../../model/UserModel'

@Entry
@Component
struct RouterPage {
	routerDetailUrl = 'pages/RouterNavigationPage/RouterDetailPage'

	@Builder
	navigationTitle() {
		Column() {
			Text('页面导航router')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		Column({ space: 10 }) {

			Button('普通导航router.pushUrl').onClick(() => {
				const url = this.routerDetailUrl
				router.pushUrl({ url: url }, (err) => {

					if (err) {
						console.error(`Invoke pushUrl ${url}  failed, code is ${err.code}, message is ${err.message}`);
						return;
					}

					console.info(`Invoke pushUrl ${url} succeeded.`);
				})

			}).width('80%')

			Button('普通导航 router.replaceUrl').onClick(() => {
				const url = this.routerDetailUrl
				router.replaceUrl({ url: url }, (err) => {

					if (err) {
						console.error(`Invoke pushUrl ${url}  failed, code is ${err.code}, message is ${err.message}`);
						return;
					}

					console.info(`Invoke pushUrl ${url} succeeded.`);
				})

			}).width('80%')

			Button('普通导航 router.pushUrl Single实例模块').onClick(() => {
				const url = this.routerDetailUrl
				router.pushUrl({ url: url }, router.RouterMode.Single, (err) => {

					if (err) {
						console.error(`Invoke pushUrl ${url}  failed, code is ${err.code}, message is ${err.message}`);
						return;
					}

					console.info(`Invoke pushUrl ${url} succeeded.`);
				})

			}).width('80%')

			Button('普通导航 router.replaceUrl Single实例模块').onClick(() => {
				const url = this.routerDetailUrl
				router.replaceUrl({ url: url }, router.RouterMode.Single, (err) => {

					if (err) {
						console.error(`Invoke pushUrl ${url}  failed, code is ${err.code}, message is ${err.message}`);
						return;
					}

					console.info(`Invoke pushUrl ${url} succeeded.`);
				})
			}).width('80%')

			Button('普通导航 router.pushUrl 带参数').onClick(() => {

				let data: DataModel = {
					id: 123,
					userInfo: {
						name: 'ksnowlv',
						age: 20,
						phoneNumber: '+86-155*****111'

					}
				};

				const url = this.routerDetailUrl
				router.pushUrl({ url: url, params: data }, (err) => {

					if (err) {
						console.error(`Invoke pushUrl ${url}  failed, code is ${err.code}, message is ${err.message}`);
						return;
					}

					console.info(`Invoke pushUrl ${url} succeeded.`);
				})

			}).width('80%')


		}.width('100%')
		.alignItems(HorizontalAlign.Center)
		.justifyContent(FlexAlign.Center)

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