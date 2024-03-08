"""Traffic light simulation using RPi.GPIO .

This module makes use of the standard GPIO library for the Raspberry Pi.
It is intended to realize a better performance than with the gpiozero library,
especially timed event handling. 
"""

try:
	import RPi.GPIO as GPIO
except RuntimeError:
	print("Error importing RPi.GPIO!  This is probably because you need superuser privileges.  You can achieve this by using 'sudo' to run your script")

GPIO.setmode(GPIO.BCM)

class TrafficLightPed:

	def __init__(self):
		# setup LEDs
		self.led_r = 12
		self.led_g = 21
		self.led_req = 16
		channel_list = [self.led_r, self.led_g, self.led_req]
		GPIO.setup(channel_list, GPIO.OUT)
		# setup button
		self.btn_req = 19
		GPIO.setup(self.btn_req, GPIO.IN, pull_up_down=GPIO.PUD_UP)
		GPIO.add_event_detect(self.btn_req, GPIO.FALLING)

	def set_red(self, bool):
		GPIO.output(self.led_r, bool)

	def set_green(self, bool):
		GPIO.output(self.led_g, bool)

	def set_request(self, bool):
		GPIO.output(self.led_req, bool)

class TrafficLightCar:

	def __init__(self):
		self.led_r = 15
		self.led_y = 18
		self.led_g = 24
		channel_list = [self.led_r, self.led_y, self.led_g]
		GPIO.setup(channel_list, GPIO.OUT)

	def set_red(self, bool):
		GPIO.output(self.led_r, bool)
		
	def set_yellow(self, bool):
		GPIO.output(self.led_y, bool)

	def set_green(self, bool):
		GPIO.output(self.led_g, bool)

class TrafficLightSystem:

	def __init__(self):
		self.tl_car = TrafficLightCar()
		self.tl_ped = TrafficLightPed()
		self.btn_onoff = 13
		self.btn_exit = 26
		channel_list = [self.btn_onoff, self.btn_exit]
		GPIO.setup(channel_list, GPIO.IN, pull_up_down=GPIO.PUD_UP)
		GPIO.add_event_detect(self.btn_exit, GPIO.FALLING)
		GPIO.add_event_detect(self.btn_onoff, GPIO.FALLING)
		self.done = False
		
	def tlSystem(self, arg):
		self.system = arg
		
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
		if GPIO.event_detected(self.tl_ped.btn_req):
			self.system.raise_pedestrian_request()
		# sys onoff button
		if GPIO.event_detected(self.btn_onoff):
			self.system.raise_on_off()
		# sys exit button
		if GPIO.event_detected(self.btn_exit):
			self.exit()

	def exit(self):
		self.done = True
		self.shutdown()
		GPIO.cleanup()

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
