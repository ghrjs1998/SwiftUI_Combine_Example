import Foundation
import Combine

// PassthroughSubject
// faliure가 Never -> 실패할리가 없을 때 사용
let relay = PassthroughSubject<String, Never>()
let subscription1 = relay.sink {value in
        print("subscription1 recevied value: \(value)")
}

relay.send("Hello")
relay.send("World!")



// CurrentValueSubject
// CurrentValueSubject같은 경우 초기값을 넣어줘야 함
let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial text")

let subscription2 = variable.sink { value in
    print("subscription2 recevied value: \(value)")
}

variable.send("More text")
variable.value



let publisher = ["Here", "we", "go"].publisher

//publisher.subscribe(relay)
publisher.subscribe(variable)
