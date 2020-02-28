# Implementation of statechart pong_npc_statemachine.

import warnings
# implemented interfaces:
from .pong_npc_statemachine_interfaces import SCI_Internal
from .pong_npc_statemachine_interfaces import SCI_ball, SCI_player, SCI_Interface
# to store states:
from enum import Enum

class Pong_npc:

	"""
	
	Implementation of the state machine 'Pong_npc'.
	
	"""
	
	def __init__(self):
		""" Declares all necessary variables including list of states, histories etc. 
		"""
		self.sci_internal = SCI_Internal()
		self.sci_ball = SCI_ball()
		self.sci_player = SCI_player()
		self.sci_interface = SCI_Interface()
		self.initialized = False
		self.state_vector = [None] * 1		
		self.next_state_index = None
		# internal scope variables:
		self.RIGHT = "right"
		self.LEFT = "left"
		self.MIDDLE = 350
		# enumeration of all states:
		self.State = Enum('State', '\
		main_region_ball_moves_left,\
		main_region_ball_moves_left_r1_go_to_the_middle,\
		main_region_ball_moves_right,\
		main_region_ball_moves_right_r1_wait,\
		main_region_ball_moves_right_r1_go_to_the_ball,\
		main_region_ball_moves_right_r1_go_to_the_ball_r1_down,\
		main_region_ball_moves_right_r1_go_to_the_ball_r1_up,\
		null_state')
	
	def init(self):
		"""	Initializes the state machine by checking the timer, 
		initializing states and clearing events.
		"""
		self.initialized = True
		for state_index in range(1):
			self.state_vector[state_index] = self.State.null_state
		self._clear_events()
		self._clear_out_events()
		self.sci_ball.position = 0.0
		self.sci_ball.direction = ""
		self.sci_player.position = 0.0
	
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
	
	def _clear_out_events(self):
		""" Resets outgoing events.
		"""
		self.sci_interface.clear_out_events()
	
	def is_state_active(self, state):
		""" Returns True if the given state is currently active otherwise false.
		"""
		s = state.name
		if s == 'main_region_ball_moves_left_r1_go_to_the_middle':
			return self.state_vector[0] == self.State.main_region_ball_moves_left_r1_go_to_the_middle
		elif s == 'main_region_ball_moves_left':
			return (self.state_vector[0].value >= self.State.main_region_ball_moves_left.value)\
				and (self.state_vector[0].value <= self.State.main_region_ball_moves_left_r1_go_to_the_middle.value)
		elif s == 'main_region_ball_moves_right':
			return (self.state_vector[0].value >= self.State.main_region_ball_moves_right.value)\
				and (self.state_vector[0].value <= self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_up.value)
		elif s == 'main_region_ball_moves_right_r1_wait':
			return self.state_vector[0] == self.State.main_region_ball_moves_right_r1_wait
		elif s == 'main_region_ball_moves_right_r1_go_to_the_ball':
			return (self.state_vector[0].value >= self.State.main_region_ball_moves_right_r1_go_to_the_ball.value)\
				and (self.state_vector[0].value <= self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_up.value)
		elif s == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_down':
			return self.state_vector[0] == self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_down
		elif s == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_up':
			return self.state_vector[0] == self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_up
		else:
			return False
	
	def enter_sequence_main_region_ball_moves_left_default(self):
		self.enter_sequence_main_region_ball_moves_left_r1_default()
		
	def enter_sequence_main_region_ball_moves_left_r1_go_to_the_middle_default(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_ball_moves_left_r1_go_to_the_middle
		self.state_vector_changed = True
		
	def enter_sequence_main_region_ball_moves_right_default(self):
		self.enter_sequence_main_region_ball_moves_right_r1_default()
		
	def enter_sequence_main_region_ball_moves_right_r1_wait_default(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_ball_moves_right_r1_wait
		self.state_vector_changed = True
		
	def enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_default(self):
		self.enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_default()
		
	def enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down_default(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_down
		self.state_vector_changed = True
		
	def enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up_default(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.main_region_ball_moves_right_r1_go_to_the_ball_r1_up
		self.state_vector_changed = True
		
	def enter_sequence_main_region_default(self):
		self.react_main_region__entry_default()
		
	def enter_sequence_main_region_ball_moves_left_r1_default(self):
		self.react_main_region_ball_moves_left_r1__entry_default()
		
	def enter_sequence_main_region_ball_moves_right_r1_default(self):
		self.react_main_region_ball_moves_right_r1__entry_default()
		
	def enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_default(self):
		self.react_main_region_ball_moves_right_r1_go_to_the_ball_r1__entry_default()
		
	def exit_sequence_main_region_ball_moves_left(self):
		self.exit_sequence_main_region_ball_moves_left_r1()
		
	def exit_sequence_main_region_ball_moves_left_r1_go_to_the_middle(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region_ball_moves_right(self):
		self.exit_sequence_main_region_ball_moves_right_r1()
		
	def exit_sequence_main_region_ball_moves_right_r1_wait(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball(self):
		self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1()
		
	def exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up(self):
		self.next_state_index = 0
		self.state_vector[0] = self.State.null_state
		
	def exit_sequence_main_region(self):
		state = self.state_vector[0].name
		if state == 'main_region_ball_moves_left_r1_go_to_the_middle':
			self.exit_sequence_main_region_ball_moves_left_r1_go_to_the_middle()		
		elif state == 'main_region_ball_moves_right_r1_wait':
			self.exit_sequence_main_region_ball_moves_right_r1_wait()
		elif state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_down':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down()
		elif state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_up':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up()
		
	def exit_sequence_main_region_ball_moves_left_r1(self):
		state = self.state_vector[0].name
		if state == 'main_region_ball_moves_left_r1_go_to_the_middle':
			self.exit_sequence_main_region_ball_moves_left_r1_go_to_the_middle()
		
	def exit_sequence_main_region_ball_moves_right_r1(self):
		state = self.state_vector[0].name
		if state == 'main_region_ball_moves_right_r1_wait':
			self.exit_sequence_main_region_ball_moves_right_r1_wait()		
		elif state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_down':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down()
		elif state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_up':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up()
		
	def exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1(self):
		state = self.state_vector[0].name
		if state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_down':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down()		
		elif state == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_up':
			self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up()
		
	def react_main_region__entry_default(self):
		self.enter_sequence_main_region_ball_moves_left_default()
		
	def react_main_region_ball_moves_left_r1__entry_default(self):
		self.enter_sequence_main_region_ball_moves_left_r1_go_to_the_middle_default()
		
	def react_main_region_ball_moves_right_r1__entry_default(self):
		self.enter_sequence_main_region_ball_moves_right_r1_wait_default()
		
	def react_main_region_ball_moves_right_r1_go_to_the_ball_r1__entry_default(self):
		self.enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up_default()
		
	def react(self):
		return False
	
	
	def main_region_ball_moves_left_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.react()) == False:
				if ((self.RIGHT is None) if (self.sci_ball.direction is None) else (self.sci_ball.direction == self.RIGHT)):
					self.exit_sequence_main_region_ball_moves_left()
					self.enter_sequence_main_region_ball_moves_right_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_ball_moves_left_r1_go_to_the_middle_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.main_region_ball_moves_left_react(try_transition)) == False:
				if self.sci_player.position < self.MIDDLE:
					self.exit_sequence_main_region_ball_moves_left_r1_go_to_the_middle()
					self.sci_interface.raise_down()
					self.enter_sequence_main_region_ball_moves_left_r1_go_to_the_middle_default()
				elif self.sci_player.position > self.MIDDLE:
					self.exit_sequence_main_region_ball_moves_left_r1_go_to_the_middle()
					self.sci_interface.raise_up()
					self.enter_sequence_main_region_ball_moves_left_r1_go_to_the_middle_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_ball_moves_right_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.react()) == False:
				if ((self.LEFT is None) if (self.sci_ball.direction is None) else (self.sci_ball.direction == self.LEFT)):
					self.exit_sequence_main_region_ball_moves_right()
					self.enter_sequence_main_region_ball_moves_left_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_ball_moves_right_r1_wait_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.main_region_ball_moves_right_react(try_transition)) == False:
				if self.sci_player.position != self.sci_ball.position:
					self.exit_sequence_main_region_ball_moves_right_r1_wait()
					self.enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_ball_moves_right_r1_go_to_the_ball_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.main_region_ball_moves_right_react(try_transition)) == False:
				if self.sci_player.position == self.sci_ball.position:
					self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball()
					self.enter_sequence_main_region_ball_moves_right_r1_wait_default()
				else:
					did_transition = False
		
		return did_transition
	
	
	def main_region_ball_moves_right_r1_go_to_the_ball_r1_down_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.main_region_ball_moves_right_r1_go_to_the_ball_react(try_transition)) == False:
				if self.sci_player.position > self.sci_ball.position:
					self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down()
					self.enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up_default()
				else:
					did_transition = False
		
		if (did_transition) == False:
			self.sci_interface.raise_down()
		
		return did_transition
	
	
	def main_region_ball_moves_right_r1_go_to_the_ball_r1_up_react(self,  try_transition):
		did_transition = try_transition
		
		if try_transition:
			if (self.main_region_ball_moves_right_r1_go_to_the_ball_react(try_transition)) == False:
				if self.sci_player.position < self.sci_ball.position:
					self.exit_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_up()
					self.enter_sequence_main_region_ball_moves_right_r1_go_to_the_ball_r1_down_default()
				else:
					did_transition = False
		
		if (did_transition) == False:
			self.sci_interface.raise_up()
		
		return did_transition
	
	
	def run_cycle(self):
		""" Starts a cycle in the state machine. 
		"""
		if self.initialized is not True:
			raise ValueError(
					'The state machine needs to be initialized first by calling the init() function.')
		self._clear_out_events()
		self.next_state_index = 0
		while self.next_state_index < len(self.state_vector):
			if self.state_vector[self.next_state_index].name == 'main_region_ball_moves_left_r1_go_to_the_middle' :
				self.main_region_ball_moves_left_r1_go_to_the_middle_react(True)
			elif self.state_vector[self.next_state_index].name == 'main_region_ball_moves_right_r1_wait' :
				self.main_region_ball_moves_right_r1_wait_react(True)
			elif self.state_vector[self.next_state_index].name == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_down' :
				self.main_region_ball_moves_right_r1_go_to_the_ball_r1_down_react(True)
			elif self.state_vector[self.next_state_index].name == 'main_region_ball_moves_right_r1_go_to_the_ball_r1_up' :
				self.main_region_ball_moves_right_r1_go_to_the_ball_r1_up_react(True)
			self.next_state_index += 1
		self._clear_events()
