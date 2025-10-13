import Foundation

print ("Hello, this is HW-Queue-Worker")

// Предлагаю реализовать блокирующую очередь и WorkerThread

let wg = WaitGroup()
let queue = BlockingQueue<()->Void>()

let onFinish: ()->Void = {
    wg.done()
}

for i in 1...5 {
    wg.add(1)
    let worker = WorkerThread(String(i), queue, onFinish)
    worker.run()
}

for i in 1...20 {
    queue.put {
        print ("running task \(i)")
        sleep(UInt32(Int.random(in: 3...10)))
        print ("completing task \(i)")
    }
}

queue.close()

print ("WG WAITING")

wg.wait()

print ("DONE")
