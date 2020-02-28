"""Interfaces defined in the state chart model.

The interfaces defined in the state chart model are represented
as separate classes.

"""

class SCI_Internal:

	""" Implementation of the Internal interface.
	"""
	
	def __init__(self):
		# init done by state machine class itself.
		pass
	
	
class SCI_ball:

	"""Implementation of scope sci_ball.
	"""
	
	def __init__(self):
		self.position = None
		self.direction = None
	
	
	

class SCI_player:

	"""Implementation of scope sci_player.
	"""
	
	def __init__(self):
		self.position = None
	
	
	

class SCI_Interface:

	"""Implementation of scope sci_interface.
	"""
	
	def __init__(self):
		self.up = None
		self.down = None
	
	
	
	def is_raised_up(self):
		return self.up
	
	def raise_up(self):
		self.up = True
		
	def is_raised_down(self):
		return self.down
	
	def raise_down(self):
		self.down = True
		
	def clear_out_events(self):
		self.up = False
		self.down = False
	

