import http from '@ohos.net.http';


export enum HttpResponseResultType {
	EXCEPTION = -1000,
	OTHER_ERROR = -100,
	SERVICE_ERROR = -3,
	CLIENT_ERROR = -2,
	NET_ERROR = -1,
	UNKNOWN = 0,
	SUCCESS = 1,
}


export class HttpResponseResult {
	resultType: HttpResponseResultType
	data: string | Object | ArrayBuffer

	constructor() {
		this.resultType = HttpResponseResultType.UNKNOWN
	}
}

export class HttpInterface {
	static readonly TAG = 'HttpInterface'
	static readonly HTTP_READ_TIMEOUT = 90 * 1000; //90ms
	static readonly HTTP_CONNECT_TIMEOUT = HttpInterface.HTTP_READ_TIMEOUT;
	static readonly CONTENT_TYPE_HEADER = {
		'Content-Type': 'application/json'
	}

	static httpRequest(
		url: string,
		params?: string | Object | ArrayBuffer,
		header?: Object
	): Promise<HttpResponseResult> {
		// 每一个httpRequest对应一个HTTP请求任务，不可复用
		const request = http.createHttp();

		let method = http.RequestMethod.POST

		if (params == null || params == undefined) {
			method = http.RequestMethod.GET
			console.info(`${HttpInterface.TAG} http get request url  :${url}, httpHeader:${JSON.stringify(header)}`)
		} else {
			console.info(`${HttpInterface.TAG} http post request url  :${url}, httpHeader:${JSON.stringify(header)} params:${JSON.stringify(params)}`)
		}

		const responseResult = request.request(url, {
			// 超时时间
			readTimeout: HttpInterface.HTTP_READ_TIMEOUT,
			connectTimeout: HttpInterface.HTTP_CONNECT_TIMEOUT,
			method,
			extraData: params,
			header: { ...HttpInterface.CONTENT_TYPE_HEADER, ...header },
		});

		let httpResponseResult: HttpResponseResult = new HttpResponseResult();

		return responseResult.then((data: http.HttpResponse) => {
			console.info(`${HttpInterface.TAG}  httpStatus code :${data.responseCode}, response httpheader:${JSON.stringify(data.header)} `)
			const responseCode = data.responseCode
			httpResponseResult.data = data.result

			if (responseCode === http.ResponseCode.OK) {
				httpResponseResult.resultType = HttpResponseResultType.SUCCESS

			} else if (responseCode >= http.ResponseCode.INTERNAL_ERROR) {
				httpResponseResult.resultType = HttpResponseResultType.SERVICE_ERROR

			} else if (responseCode >= http.ResponseCode.BAD_REQUEST) {
				httpResponseResult.resultType = HttpResponseResultType.CLIENT_ERROR
			} else {
				httpResponseResult.resultType = HttpResponseResultType.OTHER_ERROR
			}

			return httpResponseResult;

		}).catch((err) => {
			//
			console.error(`${HttpInterface.TAG} response error: ${JSON.stringify(err)}`)
			httpResponseResult.resultType = HttpResponseResultType.EXCEPTION
			httpResponseResult.data = JSON.stringify(err)
			return httpResponseResult

		}).finally(() => {
			console.info(`${HttpInterface.TAG} response finish httpResponseResult ---resultType: ${httpResponseResult.resultType},data:${httpResponseResult.data} }`)
			// 当该请求使用完毕时，调用destroy方法主动销毁
			request.destroy();
		})
	}
}








