import SwiftGtk
import Foundation
import Dispatch

class Window : SCInterfaceSwiftExampleOperationCallback {
    let statemachine = SwiftExampleStatemachine()
    let buttonStateA = Button(label: "StateA")
    let buttonStateB = Button(label: "StateB")
    let buttonStateC = Button(label: "StateC")
    let timer : DispatchSourceTimer = DispatchSource.makeTimerSource(queue: DispatchQueue.global())

    init(window: ApplicationWindow) {
        initUi(window: window)

        statemachine.getSCInterfaceSwiftExample().setSCInterfaceSwiftExampleOperationCallback(self)
        statemachine.setTimer(StatemachineTimerService())
        try! statemachine.initialize()
        try! statemachine.enter()

        timer.scheduleRepeating(deadline: .now() + .milliseconds(100), interval: .milliseconds(100), leeway: .milliseconds(0))
        timer.setEventHandler { timer in
            try! self.statemachine.runCycle()
        }
        timer.resume()
    }
    func initUi(window: ApplicationWindow) {
        window.title = "Swift Example"
        window.defaultSize = Size(width: 100, height: 66)
        window.resizable = true

        let column = ButtonBox(orientation: .vertical)
        let row = ButtonBox(orientation: .horizontal)
        column.add(buttonStateA)
        row.add(buttonStateB)
        row.add(Label())
        row.add(buttonStateC)
        column.add(row)
        window.add(column)

        buttonStateA.clicked = buttonClicked
        buttonStateB.clicked = buttonClicked
        buttonStateC.clicked = buttonClicked
    }
    func buttonClicked(button: Button) {
        statemachine.getSCInterfaceSwiftExample().setReverse(
            !statemachine.getSCInterfaceSwiftExample().getReverse()
        )
    }
    func setOpacity(stateA: Double, stateB: Double, stateC: Double) {
        buttonStateA.opacity = stateA
        buttonStateB.opacity = stateB
        buttonStateC.opacity = stateC
    }
    func stateA() {
        setOpacity(stateA: 0.5, stateB: 1.0, stateC: 1.0)
    }
    func stateB() {
        setOpacity(stateA: 1.0, stateB: 0.5, stateC: 1.0)
    }
    func stateC() {
        setOpacity(stateA: 1.0, stateB: 1.0, stateC: 0.5)
    }
}

let app = Application(applicationId: "com.yakindu.swiftexample")
app.run { window in 
    _ = Window(window: window)
}
