"""Interfaces defined in the state chart model.

The interfaces defined in the state chart model are represented
as separate classes.

"""

class SCI_user:

	"""Implementation of scope sci_user.
	"""
	
	def __init__(self, statemachine):
		self.on_button = None
		self.off_button = None
		self.brightness = None
		self.statemachine = statemachine
	
	
	
	def raise_on_button(self):
		self.on_button = True
		self.statemachine.run_cycle()
		
	def raise_off_button(self):
		self.off_button = True
		self.statemachine.run_cycle()
		
	def clear_events(self):
		self.on_button = False
		self.off_button = False
		

