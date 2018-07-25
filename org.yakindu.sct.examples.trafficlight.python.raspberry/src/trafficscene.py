"""Traffic light simulation using gpiozero.

This module makes use of the gpiozero library as used in many examples
at raspberrypi.org and others. For another implementation using RPi.GPIO
have a look at _trafficscene2.py_ .
"""

from gpiozero import LED, Button

class TrafficLightPed:

	def __init__(self):
		self.led_r = LED(12)
		self.led_g = LED(21)
		self.led_req = LED(16)
		self.btn_req = Button(19)
		self.btn_req.when_pressed = self.req_btn_pressed
		self.pressed = False

	def set_red(self, bool):
		if bool:
			self.led_r.on()
		else:
			self.led_r.off()

	def set_green(self, bool):
		if bool:
			self.led_g.on()
		else:
			self.led_g.off()

	def set_request(self, bool):
		if bool:
			self.led_req.on()
		else:
			self.led_req.off()

	def req_btn_pressed(self):
		self.pressed = True

	def is_req_btn_pressed(self):
		return self.pressed

	def clear_events(self):
		self.pressed = False

class TrafficLightCar:

	def __init__(self):
		self.led_r = LED(15)
		self.led_y = LED(18)
		self.led_g = LED(24)

	def set_red(self, bool):
		if bool:
			self.led_r.on()
		else:
			self.led_r.off()

	def set_yellow(self, bool):
		if bool:
			self.led_y.on()
		else:
			self.led_y.off()

	def set_green(self, bool):
		if bool:
			self.led_g.on()
		else:
			self.led_g.off()

class TrafficLightSystem:

	def __init__(self):
		self.tl_car = TrafficLightCar()
		self.tl_ped = TrafficLightPed()
		self.btn_onoff = Button(13)
		self.btn_exit = Button(26)
		self.btn_exit.when_pressed = self.exit
		self.done = False
		
	def set_btn_onoff(self, arg):
		self.btn_onoff.when_pressed = arg
		
	def tlSystem(self, arg):
		self.system = arg
		self.set_btn_onoff(self.system.raise_onoff)
		
	def tlPedestrian(self, arg):
		self.ped = arg
		
	def tlCar(self, arg):
		self.car = arg

	def synchronize(self):
		# car lights
		self.tl_car.set_red(self.car.red)
		self.tl_car.set_yellow(self.car.yellow)
		self.tl_car.set_green(self.car.green)
		# ped lights
		self.tl_ped.set_red(self.ped.red)
		self.tl_ped.set_green(self.ped.green)
		self.tl_ped.set_request(self.ped.request)
		# ped request button
		if self.tl_ped.is_req_btn_pressed():
			self.system.raise_pedestrianrequest()
			self.tl_ped.clear_events()

	def exit(self):
		self.done = True
		self.shutdown()

	def is_done(self):
		return self.done

	def shutdown(self): # .. the lights
		# car lights
		self.tl_car.set_red(False)
		self.tl_car.set_yellow(False)
		self.tl_car.set_green(False)
		# ped lights
		self.tl_ped.set_red(False)
		self.tl_ped.set_green(False)
		self.tl_ped.set_request(False)
