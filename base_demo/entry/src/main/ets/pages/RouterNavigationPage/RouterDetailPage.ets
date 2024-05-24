import router from '@ohos.router'

import { DataModel, UserModel } from '../../model/UserModel'

@Entry
@Component
struct RouterDetailPage {
	@State dataModel: DataModel = null

	@Builder
	navigationTitle() {
		Column() {
			Text('页面导航详情页')
				.fontColor('#182431')
				.fontSize(30)
				.lineHeight(41)
				.fontWeight(700)
		}.alignItems(HorizontalAlign.Start)
	}

	@Builder
	buildPage() {

		Column({ space: 10 }) {

			if (this.dataModel == null) {
				Text('没有获取传递过来的数据')

			} else {
				Text('获取传递过来的数据')

				Text(`id:${this.dataModel.id}`)
				Text(`name:${this.dataModel.userInfo.name}`)
				Text(`age:${this.dataModel.userInfo.age}`)
				Text(`phoneNumber:${this.dataModel.userInfo.phoneNumber}`)
			}

			Button('点击我，该页面返回前增加一个询问框;不点我，直接返回了')
				.width('80%')
				.height(50)
				.margin({ top: 30 })
				.onClick(() => {
					try {
						router.showAlertBeforeBackPage({ message: '您还没有xxx，确定要返回吗' })
					} catch (err) {
						console.error(`Invoke showAlertBeforeBackPage failed, err: ${err}`);
					}
				})

		}.width('100%')
		.alignItems(HorizontalAlign.Center)
		.justifyContent(FlexAlign.Center)

	}

	aboutToAppear() {
		this.dataModel = router.getParams() as DataModel; // 获取传递过来的参数对象
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