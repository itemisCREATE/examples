"""Example Runtime for TrafficLightCtrl on Raspberry Pi.

Please check your hardware before executing! Use the circuit shown in the
index.html .

You could choose between two _APIs_: _trafficscene_ and _trafficscene2_.  
"""

import sys, os
path_to_package = '../src-gen/traffic/light/TrafficLightCtrl'
sys.path.insert(0, os.path.abspath(os.path.join(os.path.dirname(__file__), path_to_package)))

from trafficlightctrl.traffic_light_ctrl import TrafficLightCtrl
from trafficlightctrl.timer.sct_timer import Timer

# using RPi.GPIO:
from trafficscene import TrafficLightSystem 
# or using gpiozero:
# from trafficscene2 import TrafficLightSystem

class TrafficLightCtrlRuntime:

	def __init__(self):
		self.sm = TrafficLightCtrl()
		self.ti = Timer()
		self.traffic_system = TrafficLightSystem()
		self.sm.sci_interface.operation_callback = self.traffic_system
		self.MAX_DURATION = 40 # seconds

	def setup(self):
		""" Get statemachine ready and enter it.
		"""
		self.traffic_system.set_btn_onoff(self.sm.sci_interface.raise_on_off)
		self.traffic_system.tlSystem(self.sm.sci_interface)
		self.traffic_system.tlCar(self.sm.sci_trafficlight)
		self.traffic_system.tlPedestrian(self.sm.sci_pedestrian)
		self.sm.set_timer(self.ti)
		self.sm.init()
		self.sm.enter()

	def run(self):
		""" Include your interface actions here
		"""
		self.start_time = time.time()
		while not self.traffic_system.is_done():
			self.sm.run_cycle()

	def shutdown(self):
		""" Unset timer and exit statemachine.
		"""
		print('State machine shuts down.')
		self.sm.unset_timer()
		self.sm.exit()
		print('Bye!')


if __name__ == "__main__":
	sr = TrafficLightCtrlRuntime()
	sr.setup()
	sr.run()
	sr.shutdown()
