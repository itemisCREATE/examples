from light.light import Light
from controller.light_controller import LightController
from yakindu.rx import Observer
from yakindu.timer.timer_service import TimerService


class Main:
    
    # Observer with callback for the light.on event 
    class Light1Observer(Observer):

        def next(self, value):
            print("Light 1 Brightness: " + str(value))

    # Observer with callback for the light.off event 
    class Light2Observer(Observer):

        def next(self, value):
            print("Light 2 Brightness: " + str(value))
    
    def __init__(self):
        # Instantiates the state machines
        self.controller = LightController()
        self.light1 = Light()
        self.light2 = Light()
        # Instantiates observer for the out events 
        self.light1Observer = self.Light1Observer()
        self.light2Observer = self.Light2Observer()
        
    def setup(self):
        # Set the timer services
        self.controller.timer_service = TimerService()
        self.light1.timer_service = TimerService()
        self.light2.timer_service = TimerService()
        
        # Set the sub machines
        self.controller.light1 = self.light1
        self.controller.light2 = self.light2
        
        # Subscribes observers the lights' brightness_changed events
        self.light1.brightness_changed_observable.subscribe(self.light1Observer)
        self.light2.brightness_changed_observable.subscribe(self.light2Observer)
         
        # Enters the state machine; from this point on the state machine is ready to react on incoming event 
        self.controller.enter()

    def run(self):
        print("Type 'On' or 'Off' to switch the light on or off.")
        print("Type 'Blink' to toggle the blink mode.")
        while not self.controller.is_final() :
            self.input = input()
            if self.input == 'On':
                # Raises the switch_on event in the state machine which causes the corresponding transition to be taken 
                self.controller.user.raise_switch_on()
            elif self.input == 'Off':
                # Raises the switch_off event in the state machine 
                self.controller.user.raise_switch_off()
            elif self.input == 'Blink':
                # Raises the blink_mode event in the state machine 
                self.controller.user.raise_blink_mode()
        self.shutdown()
    
    def shutdown(self):
        self.controller.exit()
        

if __name__ == '__main__':
    m = Main()
    m.setup()
    m.run()
