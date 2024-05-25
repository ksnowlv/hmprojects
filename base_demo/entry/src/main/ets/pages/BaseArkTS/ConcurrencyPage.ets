import fs from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { MyTask } from '../../model/MyTask'
import worker from '@ohos.worker';


@Entry
@Component
struct ConcurrencyPage {
	TAG = 'ConcurrencyPage'
	@State state: number = 0
	@State userResult: string = ''
	@State userContent: string = ''
	@State num: number = 0
	@State taskRes: string = ''
	myWorker: worker.ThreadWorker = new worker.ThreadWorker("entry/ets/workers/MyWorker.ts");
	jsWorkerInPutArr: string[] = [];
	@State jsWorkerOutPutStr: string = ''
	@State jsWorkerInPutStr: string = 'I am,go home,go,thank you,help me,wellcome,get out,I need your help,bye bye,good night'

	@Builder
	navigationTitle() {
		Column() {
			Text('并发编程')
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
					Text('---Promise---可以将异步操作转换为类似于同步操作的风格，以方便代码编写和维护。Promise提供了一个状态机制来管理异步操作的不同阶段，并提供了一些方法来注册回调函数以处理异步操作的成功或失败的结果。\nPromise有三种状态：pending（进行中）、fulfilled（已完成）和rejected（已拒绝）。Promise对象创建后处于pending状态，并在异步操作完成后转换为fulfilled或rejected状态')
						.width('80%')

					if (this.state == -1) {
						Text('状态出错:')
					} else if (this.state == 0) {
						Text('初始状态:0')
					} else {
						Text(`状态为${this.state}`)
					}

					Button('Promise基础使用')
						.width('80%')
						.onClick(() => {
							this.handlePromise()
						})

					Text('async/await是一种用于处理异步操作的Promise语法糖，使得编写异步代码变得更加简单和易读。通过使用async关键字声明一个函数为异步函数，并使用await关键字等待Promise的解析（完成或拒绝），以同步的方式编写异步操作的代码\nasync函数是一个返回Promise对象的函数，用于表示一个异步操作。在async函数内部，可以使用await关键字等待一个Promise对象的解析，并返回其解析值。如果一个async函数抛出异常，那么该函数返回的Promise对象将被拒绝，并且异常信息会被传递给Promise对象的onRejected()方法')
						.width('80%')

					Text(`async/await获取的内容为${this.userResult}`)

					Button('async/await fetchUseResult')
						.width('80%')
						.onClick(async () => {
							try {
								this.userResult = await this.fetchUseResult()
							} catch (error) {
								console.info(`error:${error}`)
							}
						})

					Text(`async/await获取的内容为${this.userContent}`)

					Button('async/await fetchUserContent with try catch')
						.width('80%')
						.onClick(async () => {
							this.userContent = await this.fetchUserContent()
						})

					Text(`async/await获取的内容为${this.num}`)

					Button('async/await with try catch')
						.width('80%')
						.onClick(() => {
							try {

								let res = this.getPromiseResult();
								if (typeof res === 'number') {
									// 如果 res 直接就是数字类型
									this.num += res;
								} else {
									// 如果 res 为 undefined 或其他非预期类型，则设置默认值
									this.num = -1;
								}
							} catch (error) {
								// 处理可能出现的错误
								console.error('Promise 执行出错:', error);
								this.num = -1; // 出错时设置 this.num 为 -1 或其他错误代码
							}
						})


					Button('采用异步能力调用单次I/O任务,使用异步进行单次文件写入')
						.width('80%')
						.onClick(() => {
							this.writeTextToFile()

						})

					Text('当任务不需要长时间（3分钟）占据后台线程，而是一个个独立的任务时，推荐使用TaskPool，反之推荐使用Worker。')
						.width('80%')

					Text(`MyTask.handleReadFile:${this.taskRes}`)
						.width('80%')
						.fontColor(Color.Green)
					
					Button('TaskPool-CPU密集型任务')
						.width('80%')
						.onClick(async () => {
							let res = await MyTask.handleReadFile()
							if (typeof res === 'string') {
								this.taskRes = res
							} else {
								this.taskRes = 'error'
							}
						})

					Text('Worker主要作用是为应用程序提供一个多线程的运行环境，可满足应用程序在执行过程中与主线程分离，在后台线程中运行一个脚本操作耗时操作，极大避免类似于计算密集型或高延迟的任务阻塞主线程的运行')
						.width('80%')
					Text('Worker创建后需要手动管理生命周期，且最多同时运行的Worker子线程数量为8个，详情请参见生命周期注意事项。\nAbility类型的Module支持使用Worker，Library类型的Module不支持使用Worker。\n创建Worker不支持使用其他Module的Worker.ts文件，即不支持跨模块调用Worker。\n由于不同线程中上下文对象是不同的，因此Worker线程只能使用线程安全的库，例如UI相关的非线程安全库不能使用。\n序列化传输的数据量大小限制为16MB。\n使用Worker模块时，需要在主线程中注册onerror接口，否则当worker线程出现异常时会发生jscrash问题。')
						.width('80%')

					Text(this.jsWorkerInPutStr)
						.width('80%').fontColor(Color.Green)

					Text(`Worker 字符串排序后:${this.jsWorkerOutPutStr}`)
					Button('Worker分割字符串')
						.width('80%')
						.onClick(() => {
							this.jsWorkerInPutArr = this.jsWorkerInPutStr.trim().split(',');
							this.jsWorkerOutPutStr = '';
							this.executeWorkerFunc(this.jsWorkerInPutArr);
						})


				}.width('100%')
				.alignItems(HorizontalAlign.Center)
				.justifyContent(FlexAlign.Center)
			}
		}

	}

	handlePromise() {
		const promise = new Promise((resolve, reject) => {
			setTimeout(() => {
				const num = Math.random()
				console.info(`handlePromise: ${num}}`)

				if (num > 0.3) {
					resolve(num)
				} else {
					reject(new Error('数据不符合预期'))
				}
			}, 1000)
		})

		promise.then((result: number) => {
			this.state = result

		}).catch((error) => {
			this.state = -1
		})
	}

	async fetchUseResult(): Promise<string> {
		return new Promise((resolve: Function) => {
			setTimeout(() => {
				resolve('Hello, world!');
			}, 1000);
		},)
	}

	async fetchUserContent(): Promise<string> {

		try {
			const result: string = await new Promise((resolve: Function) => {
				setTimeout(() => {
					resolve('Hello, world! I am coming');
				}, 1000);
			},);

			return result.toString()

		} catch (error) {
			console.info(`fetchUserContent error: ${error}`)
			throw error;
		} finally {
			console.info(`fetchUserContent done`)
		}
	}

	async getPromiseResult(): Promise<number | void> {
		let promise: Promise<number | void> = new Promise<Object>((resolve: Function, reject: Function) => {
			setTimeout(() => {
				resolve(1)
			}, 1000)
		}).then(undefined, () => {

		})

		return promise;
	}

	private async write(data: string, file: fs.File): Promise<void> {
		fs.write(file.fd, data).then((writeLen: number) => {
			console.info('write data length is: ' + writeLen)
		}).catch((err) => {
			console.error(`Failed to write data. err is ${err}`);
		})
	}

	async writeTextToFile(): Promise<void> {
		let context = getContext() as common.UIAbilityContext;
		let filePath: string = context.filesDir + "/test.txt";
		let file: fs.File = await fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
		this.write('Hello World!', file).then(() => {
			console.info('Succeeded in writing data.');
		}).catch((err) => {
			console.error(`Failed to write data. Code is ${err}`);
		}).finally(() => {
			if (file) {
				fs.close(file);
			}
		})
	}

	async executeWorkerFunc(inPutArr: string[]): Promise<void> {
		if (!this.jsWorkerInPutStr.length) {
			this.jsWorkerOutPutStr = "No input for the string to be sorted.\n";
			return;
		}

		for (let index = 0; index < inPutArr.length; index++) {
			console.log(`${this.TAG}, jsWorkerInPutStr:${inPutArr[index]}`)

		}

		this.myWorker.postMessage(inPutArr);
		let strFlag = false;
		let outPutStr = '';
		this.myWorker.onmessage = (e) => {
			outPutStr = e.data.toString();
			console.log(`${this.TAG}, onmessage outPutStr:${outPutStr}`)
			strFlag = true;
		}
		while (!strFlag) {
			await this.promiseCase();
		}
		this.jsWorkerOutPutStr = outPutStr;
	}

	async promiseCase(): Promise<Object | void> {
		let p: Promise<Object | void> = new Promise<Object>((resolve: Function, reject: Function) => {
			setTimeout(() => {
				resolve(1)
			}, 100)
		}).then(undefined, () => {
		})
		return p;
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


// async function getResult(): Promise<string> {
// 	const result: string = await new Promise((resolve: Function) => {
// 		setTimeout(() => {
// 			resolve('Hello, world!');
// 		}, 1000);
// 	},);
// 	console.info(result); // 输出： Hello, world!
// 	return result
// }

// async function getResult1(): Promise<string> {
//
// 	try {
// 		const result: string = await new Promise((resolve: Function) => {
// 			setTimeout(() => {
// 				resolve('Hello, world! I am coming');
// 			}, 1000);
// 		},);
// 		console.info(result); // 输出： Hello, world!
// 		return result
//
// 	} catch (e) {
// 		console.info(`getResult1 error ${e}`)
// 	} finally {
// 		console.info(`getResult1 done`)
// 	}
// }


// async function testPromise(): Promise<number | void> {
// 	let p: Promise<number | void> = new Promise<Object>((resolve: Function, reject: Function) => {
// 		setTimeout(() => {
// 			resolve(1)
// 		}, 1000)
// 	}).then(undefined, () => {
// 	})
// 	return p;
// }
//
// async function write(data: string, file: fs.File): Promise<void> {
// 	fs.write(file.fd, data).then((writeLen: number) => {
// 		console.info('write data length is: ' + writeLen)
// 	}).catch((err) => {
// 		console.error(`Failed to write data. err is ${err}`);
// 	})
// }
//
//
// async function testFunc(): Promise<void> {
// 	let context = getContext() as common.UIAbilityContext;
// 	let filePath: string = context.filesDir + "/test.txt"; // 应用文件路径
// 	let file: fs.File = await fs.open(filePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
// 	write('Hello World!', file).then(() => {
// 		console.info('Succeeded in writing data.');
// 		fs.close(file);
// 	}).catch((err) => {
// 		console.error(`Failed to write data. Code is ${err}`);
// 		fs.close(file);
// 	})
// }
