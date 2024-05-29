import { HttpInterface, HttpResponseResult, HttpResponseResultType } from '../http/HttpInterface'
import { MyUser, Subscriptions, UserInfo } from '../model/MyUser'
import { FileMgr } from '../util/FileMgr'
import common from '@ohos.app.ability.common';
import util from '@ohos.util';
import { } from '../model/MyUser'
import { Article, Comments, Author, ArticleInfo } from '../model/ArticleInfo'

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
	@State jsonContent: string = ''
	@State myUser: MyUser = null

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

					Text(`read json:${this.jsonContent}`)
						.width('80%')
						.margin({ top: 20 })

					Button('Json to Object')
						.width('80%')
						.onClick(() => {
							this.jsonToObject()
						})
					
					Button('Object To Json')
						.width('80%')
						.onClick(() => {
							this.objectToJson()
						})

					Button('Object => Json & Json => Object')
						.width('80%')
						.onClick(() => {
							this.jsonTest()
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
				console.info(`${this.TAG} httpRequest 请求成功数据: ${JSON.stringify(response.data)}`)
				this.postResponseData = JSON.stringify(response.data)
			} else {
				console.info(`${this.TAG} httpRequest 请求失败数据: ${response.resultType} error:${JSON.stringify(response.data)}`)
			}
		}).catch(err => {
			console.info(`${this.TAG} httpRequest 请求失败 error:${JSON.stringify(err)}`)

		})
	}

	async jsonToObject() {
		try {
			var context = getContext() as common.UIAbilityContext;
			///json/article_info.json
			const rawFile = await context.resourceManager.getRawFileContent("/json/user_info.json")
			// let textDecoder = util.TextDecoder.create('gbk', { ignoreBOM: true });
			let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
			const result = textDecoder.decodeWithStream(rawFile, { stream: false })
			console.info(`${this.TAG} json content:${result}}`)
			this.jsonContent = result
		} catch (error) {
			console.info(`${this.TAG} json content:${JSON.stringify(error)}}`)
		}

		try {
			this.myUser = JSON.parse(this.jsonContent);
			const userInfo = this.myUser.userInfo;
			console.info(`${this.TAG} userInfo Name: ${userInfo.name} Age: ${userInfo.age} Address: ${userInfo.address} Account: ${userInfo.account}`)

			const subscriptions = this.myUser.subscriptions;

			subscriptions.forEach((subscription, index) => {
				console.info(`${this.TAG} Subscription ${index + 1}:`);
				console.info(`${this.TAG}  Title: ${subscription.title}`);
				console.info(`${this.TAG}  Subtitle: ${subscription.subtitle}`);
				console.info(`${this.TAG}  Content: ${subscription.content}`);
				console.info(`${this.TAG}  Subscription ID: ${subscription.subscriptionId}`);
				console.info(`${this.TAG}  Likes: ${subscription.likes}`);
			});
		} catch (error) {
			console.error(`${this.TAG} json content:${JSON.stringify(error)}}`)
		}
	}

	objectToJson() {
		try {
			let json = JSON.stringify(this.myUser)
			console.info(`${this.TAG} objectToJson jsonString :${json}}`)
		} catch (error) {
			console.error(`${this.TAG} json content:${JSON.stringify(error)}}`)
		}
	}

	async jsonTest() {

		let result = null
		try {
			var context = getContext() as common.UIAbilityContext;
			const rawFile = await context.resourceManager.getRawFileContent("/json/article_info.json")
			let textDecoder = util.TextDecoder.create('utf-8', { ignoreBOM: true });
			result = textDecoder.decodeWithStream(rawFile, { stream: false })
			console.info(`${this.TAG} json content:${result}}`)
		} catch (error) {
			console.error(`${this.TAG} load json error:${JSON.stringify(error)}}`)
		}

		try {
			const articleInfo: ArticleInfo = JSON.parse(result)
			const aticle: Article = articleInfo?.article
			console.info(`${this.TAG} aticle id: ${aticle?.id} title: ${aticle?.title} content: ${aticle?.content} `)
			const tags = aticle?.tags;

			tags.forEach((tag, index) => {
				console.info(`${this.TAG} tag ${index + 1} tag:${tag}`);
			})

			// 访问tags数组
			const comments = aticle.comments;

			comments.forEach((comment, index) => {
				console.info(`${this.TAG} comments ${index + 1}:`);
				console.info(`${this.TAG}  id: ${comment?.id}`);
				console.info(`${this.TAG}  text: ${comment?.text}`);
				console.info(`${this.TAG}  author id: ${comment.author?.id},author name ${comment.author?.name}`);
			});

			let json = JSON.stringify(articleInfo)
			console.info(`${this.TAG} articleInfo objectToJson jsonString :${json}}`)

		} catch (error) {
			console.info(`${this.TAG} jsonTest error:${JSON.stringify(error)}}`)
		}
	}
}

