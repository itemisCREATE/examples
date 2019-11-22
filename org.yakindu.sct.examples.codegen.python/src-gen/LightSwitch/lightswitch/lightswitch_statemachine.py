# Implementation of statechart lightswitch_statemachine.

import warnings
# implemented interfaces:
from .lightswitch_statemachine_interfaces import SCI_user
# to store states:
from enum import Enum

class LightSwitch:

	"""
	
	Implementation of the state machine 'LightSwitch'.
	
	"""
	
	def __init__(self):
		""" Declares all necessary variables including list of states, histories etc. 
		"""
		self.sci_user = SCI_user(self)
		self.initialized = False
		self.state_vector = [None] * 1		
		self.next_state_index = None		
		# enumeration of all states:
		self.State = Enum('State', '\
		main_region_off,\
		main_region_on,\
		null_state')
	
	def init(self):
		"""	Initializes the state machine by checking the timer, 
		initializing states and clearing events.
		"""
		self.initialized = True
		for state_index in range(1):
			self.state_vector[state_index] = self.State.null_state
		self._clear_events()
		self.sci_user.brightness = 0
	
	def enter(self):
		if self.initialized is not True:
			raise ValueError(
					'The state machine needs to be initialized first by calling the init() function.')
		self.enter_sequence_main_region_default()
	
	def exit(self):
		"""	Exit the the state machine.
		"""
		self.exit_sequence_main_region()
	
	def is_active(self):
		""" @see IStatemachine#is_active()
		"""
		return (self.state_vector[0] is not self.State.null_state)
	
	def is_final(self):
		"""Always returns 'false' since this state machine can never become final.
		@see IStatemachine#is_final()
		"""
		return False
			
	def _clear_events(self):
		""" Resets incoming events (time events included).
		"""
		self.sci_user.clear_events()
	
	def is_state_active(self, state):
		""" Returns True if the given state is currently active otherwise false.
		"""
		s = state.name
		if s == 'main_region_off':
			return self.state_vector[0] == self.State.main_region_off
		elif s == 'main_region_on':
			return self.state_vector[0] == self.State.main_region_on
		else:
			return False
	
	def entry_action_main_region_off(self):
		self.sci_user.brightness = 0
		
	def enter_sequence_main_region_off_default(self):
		self.entry_action_main_region_off()
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_off
		
	def enter_sequence_main_region_on_default(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_on
		
	def enter_sequence_main_region_default(self):
		self.react_main_region__entry_default()
		
	def exit_sequence_main_region_off(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region_on(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region(self):
		state = self.state_vector[0].name
		if state == 'main_region_off':
			self.exit_sequence_main_region_off()		
		elif state == 'main_region_on':
			self.exit_sequence_main_region_on()
		
	def react_main_region__entry_default(self):
		self.enter_sequence_main_region_off_default()
		
	def react(self):
		return False
	
	
	def main_region_off_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.react()) == False:
				if self.sci_user.on_button:
					self.exit_sequence_main_region_off()
					self.sci_user.brightness = 1
					self.enter_sequence_main_region_on_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_on_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.react()) == False:
				if self.sci_user.off_button:
					self.exit_sequence_main_region_on()
					self.enter_sequence_main_region_off_default()
				elif ((self.sci_user.on_button) and ((self.sci_user.brightness) < 10)):
					self.exit_sequence_main_region_on()
					self.sci_user.brightness = self.sci_user.brightness + 1
					self.enter_sequence_main_region_on_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def run_cycle(self):
		""" Starts a cycle in the state machine. 
		"""
		if self.initialized is not True:
			raise ValueError(
					'The state machine needs to be initialized first by calling the init() function.')
		self.next_state_index = 0
		while self.next_state_index < len(self.state_vector):
			if self.state_vector[self.next_state_index].name == 'main_region_off' :
				self.main_region_off_react(True)
			elif self.state_vector[self.next_state_index].name == 'main_region_on' :
				self.main_region_on_react(True)
			self.next_state_index += 1
			
		self._clear_events()
