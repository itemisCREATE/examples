import sys, os
path_to_statemachine = '../src-gen/LightSwitch'
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), path_to_statemachine)))
from lightswitch.lightswitch_statemachine import LightSwitch

class Main:
    def __init__(self):
        self.sm = LightSwitch()
        
    def setup(self):
        print("Interact with the light switch [On]/[Off]:")
        self.sm.init()
        self.sm.enter()

    def run(self):
        while not self.sm.is_final() :
            self.input = input()
            if self.input == 'On':
                self.sm.sci_user.raise_on_button()
                self.printStatus()
            elif self.input == 'Off':
                self.sm.sci_user.raise_off_button()
                self.printStatus()
        self.shutdown()
    
    def shutdown(self):
        self.sm.exit()
        print("Bye!")
        
    def printStatus(self):
        if(self.sm.is_state_active(self.sm.State.main_region_on)): 
            print("Light Switch is On  [brightness =", self.sm.sci_user.brightness, "]")
        else:
            print("Light Switch is Off")
            

if __name__ == '__main__':
    m = Main()
    m.setup()
    m.run()
