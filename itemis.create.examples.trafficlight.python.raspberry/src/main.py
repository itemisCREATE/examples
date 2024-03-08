"""Example Runtime for TrafficLightCtrl on Raspberry Pi.

Please check your hardware before executing! Use the circuit shown in the
index.html .

You could choose between two _APIs_: _trafficscene_ and _trafficscene2_.  
"""

from traffic_light_ctrl import TrafficLightCtrl
from yakindu.timer.timer_service import TimerService

# using RPi.GPIO:
from trafficscene import TrafficLightSystem 
# or using gpiozero:
# from trafficscene2 import TrafficLightSystem

class TrafficLightCtrlRuntime:

	def __init__(self):
		self.sm = TrafficLightCtrl()
		self.ti = TimerService()
		self.traffic_system = TrafficLightSystem()
		self.sm.operation_callback = self.traffic_system
		self.MAX_DURATION = 40 # seconds

	def setup(self):
		""" Get statemachine ready and enter it.
		"""
		self.traffic_system.set_btn_onoff(self.sm.raise_on_off)
		self.traffic_system.tlSystem(self.sm)
		self.traffic_system.tlCar(self.sm.traffic_light)
		self.traffic_system.tlPedestrian(self.sm.pedestrian)
		self.sm.timer_service = self.ti
		self.sm.enter()

	def run(self):
		""" Include your interface actions here
		"""
		self.start_time = time.time()
		while not self.traffic_system.is_done():
			self.sm.run_cycle()

	def shutdown(self):
		""" Exit statemachine.
		"""
		print('State machine shuts down.')
		self.sm.exit()
		print('Bye!')


if __name__ == "__main__":
	sr = TrafficLightCtrlRuntime()
	sr.setup()
	sr.run()
	sr.shutdown()
