import worker, { ThreadWorkerGlobalScope, MessageEvents, ErrorEvent } from '@ohos.worker';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = function (e: MessageEvents) {
  let oldArr = e.data;
  let newArr = strSort(oldArr);
  workerPort.postMessage(newArr);

}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = function (e: MessageEvents) {
  console.log("onmessageerror worker::error = " + e.data);
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = function (e: ErrorEvent) {
  console.log("onerror worker::error ");
}

function strSort(inPutArr): string {
  let newArr = inPutArr.sort();
  for (let index = 0; index < newArr.length; index++) {
    const element = newArr[index];
    console.info(`ConcurrencyPage newArr js ${element}`)
  }
  return newArr;
}