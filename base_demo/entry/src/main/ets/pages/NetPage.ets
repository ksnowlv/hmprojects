import { HttpInterface, HttpResponseResult, HttpResponseResultType } from '../http/HttpInterface'
import http from '@ohos.net.http';

class PageInfo {
	pageIndex = 0
	pageNum = 0

	constructor() {
		this.pageIndex = 0
		this.pageNum = 0
	}
}


@Entry
@Component
struct NetPage {
	TAG = 'NetPage'
	@State getResponseData: string = ''
	@State postResponseData: string = ''

	@Builder
	navigationTitle() {
		Column() {
			Text('网络与连接')
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

					Text(`http get:${this.getResponseData}`)
						.width('80%')
					Button('http get')
						.width('80%')
						.onClick(() => {
							this.httpGet()
						})

					Text(`http post:${this.postResponseData}`)
						.width('80%')
						.margin({ top: 20 })

					Button('http post')
						.width('80%')
						.onClick(() => {
							this.httpPost()
						})


				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}
		}.width('100%')

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

	httpGet() {

		//const url = 'http://127.0.0.1:8081/user/home'
		const url = 'http://10.0.2.2:8081/user/home'
		HttpInterface.httpRequest(url).then(response => {
			if (response.resultType === HttpResponseResultType.SUCCESS) {
				console.info(`${this.TAG} httpRequest 请求成功数据: ${JSON.stringify(response.data)}`)
				this.getResponseData = JSON.stringify(response.data)
			} else {
				console.info(`${this.TAG} httpRequest 请求失败数据: ${response.resultType} error:${JSON.stringify(response.data)}`)
			}
		}).catch(err => {
			console.info(`${this.TAG} httpRequest 请求失败 error:${JSON.stringify(err)}`)
		})
	}

	httpPost() {
		// const url = 'http://127.0.0.1:8081/user/test'
		const url = 'http://10.0.2.2:8081/user/test'
		const pageInfo = {
			"pageIndex": 0,
			"pageNumber": 10
		}

		HttpInterface.httpRequest(url, pageInfo).then(response => {
			if (response.resultType === HttpResponseResultType.SUCCESS) {
				console.log(`${this.TAG} httpRequest 请求成功数据: ${JSON.stringify(response.data)}`)
				this.postResponseData = JSON.stringify(response.data)
			} else {
				console.log(`${this.TAG} httpRequest 请求失败数据: ${response.resultType} error:${JSON.stringify(response.data)}`)
			}
		}).catch(err => {
			console.info(`${this.TAG} httpRequest 请求失败 error:${JSON.stringify(err)}`)

		})
	}
}

