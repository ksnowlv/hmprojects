import taskpool from '@ohos.taskpool';


@Concurrent
function readFile(num: number): string {

	return 'hello taskpool ';
}


export class MyTask {
	static async handleReadFile(): Promise<string> {
		// 创建 Task 对象时，传递一个函数引用，而不是 this.readFile

		let task = new taskpool.Task(readFile, 2);

		try {
			// 等待 taskpool.execute(task) 解析并获取结果
			let res = await taskpool.execute(task) as string;
			console.info(`MyTask handleReadFile ${res}`)
			return res
		} catch (error) {
			// 处理可能出现的错误
			console.error('MyTask execution failed:', error);
			throw error; // 重新抛出错误，或根据需要处理
		}
	}
}