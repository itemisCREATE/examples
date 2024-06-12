from light_switch import LightSwitch
from yakindu.rx import Observer
from yakindu.timer.timer_service import TimerService

class Main:
    
    # Observer with callback for the light.on event 
    class LightOnObserver(Observer):
        def next(self):
            print("Light is on.")

    # Observer with callback for the light.off event 
    class LightOffObserver(Observer):
        def next(self):
            print("Light is off.")
        
    
    def __init__(self):
        # Instantiates the state machine 
        self.sm = LightSwitch()
        # Instantiates observer for the out events 
        self.lightOnObserver = self.LightOnObserver()
        self.lightOffObserver = self.LightOffObserver()
        
    def setup(self):
        # Set the timer service
        self.sm.timer_service = TimerService()
        # Subscribes observers to the state machine's observables 
        self.sm.light.on_observable.subscribe(self.lightOnObserver)
        self.sm.light.off_observable.subscribe(self.lightOffObserver)
        # Enters the state machine; from this point on the state machine is ready to react on incoming event 
        self.sm.enter()

    def run(self):
        print("Type 'On' or 'Off' to switch the light on or off.")
        while not self.sm.is_final() :
            self.input = input()
            if self.input == 'On':
                # Raises the On event in the state machine which causes the corresponding transition to be taken 
                self.sm.user.raise_on_button()
                self.print_status()
            elif self.input == 'Off':
                # Raises the Off event in the state machine 
                self.sm.user.raise_off_button()
                self.print_status()
        self.shutdown()
    
    def shutdown(self):
        self.sm.exit()
        
    def print_status(self):
        # Gets the value of the brightness variable 
        brightness = self.sm.light.brightness
        print("Brightness: ", brightness, ".")
            

if __name__ == '__main__':
    m = Main()
    m.setup()
    m.run()
