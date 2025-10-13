//
//  classes.swift
//  HW-Queue-Worker
//
//  Created by Alexey Buravov on 14.10.2025.
//

import Foundation


class BlockingQueue<T> {
    private var data: [T] = []
    private let cond = NSCondition()
    private(set) var isClosed = false
    
    func put (_ item: T) {
        cond.lock()
        defer {cond.unlock()}
        if isClosed {
            return
        }
        data.append(item)
        cond.signal()
    }
    
    func pull () -> T? {
        cond.lock()
        defer {cond.unlock()}
        while data.isEmpty && !isClosed {
            cond.wait()
        }
        if data.isEmpty && isClosed {
            return nil
        }
        return data.removeFirst()
    }
    
    func close () {
        cond.lock()
        isClosed = true
        cond.broadcast()
        cond.unlock()
    }
}

class WorkerThread {
    let name:String
    private let queue: BlockingQueue<()->Void>
    private let onFinish: ()->Void
    
    init (_ name: String, _ queue: BlockingQueue<()->Void>, _ onFinish: @escaping ()->Void) {
        self.name = name
        self.queue = queue
        self.onFinish = onFinish
    }
    
    func run () {
        let thread = Thread {
            
            while true {
                let task = self.queue.pull()
                if task == nil {
                    print ("Worker \(self.name): no more tasks, stopping worker")
                    break
                }
                print ("Worker \(self.name): running task")
                task!()
            }
            
            print ("Worker \(self.name): stopped")
            self.onFinish()
        }
        
        print ("Worker \(self.name): starting in separate thread")
        thread.start()
    }
}

class WaitGroup {
    private let cond = NSCondition()
    private var count: Int = 0
    
    func add (_ count: Int) {
        cond.lock()
        defer {cond.unlock()}
        self.count += count
        print ("add: wg count: \(self.count)")
    }
    
    func done () {
        cond.lock()
        defer {cond.unlock()}
        count -= 1
        if count <= 0 {
            cond.broadcast()
        }
        print ("done: wg count: \(self.count)")
    }
    
    func wait () {
        cond.lock()
        while count > 0 {
            cond.wait()
        }
        cond.unlock()
    }
}
