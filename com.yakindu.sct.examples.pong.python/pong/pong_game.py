from pong.pong_ui import PongUI
from random import uniform
import math


class PongGame:
    UP = 'up'
    DOWN = 'down'
    PLAYER_ONE = 1
    PLAYER_TWO = 2
    RIGHT = 'right'
    LEFT = 'left'

    def __init__(self):
        starting_position = PongUI.get_starting_position()
        self.player1_position = starting_position
        self.player2_position = starting_position
        self.ball_pos = [int((PongUI.WINDOW_WIDTH / 2.)), int(PongUI.WINDOW_HEIGHT / 2)]
        self.ball_direction = self.RIGHT
        self.ball_angle = 0
        self.ball_speed = 20

    def move(self, direction, player):
        if player == self.PLAYER_ONE and not self.border_collision(self.player1_position, direction):
            if direction == self.UP:
                self.player1_position -= 10
            if direction == self.DOWN:
                self.player1_position += 10

        if player == self.PLAYER_TWO and not self.border_collision(self.player2_position, direction):
            if direction == self.UP:
                self.player2_position -= 10
            if direction == self.DOWN:
                self.player2_position += 10

    def border_collision(self, position, direction):
        if position == 0 and direction == self.UP:
            return True
        if position == PongUI.WINDOW_HEIGHT - PongUI.PLAYER_HEIGHT and direction == self.DOWN:
            return True
        return False

    def check_for_collisions(self):
        if self.ball_pos[1] - PongUI.BALL_RADIUS <= 0 or self.ball_pos[1] + PongUI.BALL_RADIUS >= PongUI.WINDOW_HEIGHT:
            self.ball_angle *= -1
        if self.ball_direction == self.RIGHT:
            if self.player2_position <= self.ball_pos[1] <= self.player2_position + PongUI.PLAYER_HEIGHT:
                if PongUI.WINDOW_WIDTH - PongUI.PLAYER_OFFSET >= self.ball_pos[0] >= \
                        PongUI.WINDOW_WIDTH - PongUI.PLAYER_OFFSET - PongUI.PLAYER_WIDTH:
                    self.ball_direction = self.LEFT
                    self.update_angle_after_hit()

        if self.ball_direction == self.LEFT:
            if self.player1_position <= self.ball_pos[1] <= self.player1_position + PongUI.PLAYER_HEIGHT:
                if PongUI.PLAYER_OFFSET <= self.ball_pos[0] <= PongUI.PLAYER_OFFSET + PongUI.PLAYER_WIDTH:
                    self.ball_direction = self.RIGHT
                    self.update_angle_after_hit()

    def update_angle_after_hit(self):
        self.ball_angle = int(uniform(-30, 30))

    def update_ball(self):
        self.check_for_collisions()
        angle_r = math.radians(self.ball_angle)
        dx = int(math.cos(angle_r) * self.ball_speed)
        dy = int(math.sin(angle_r) * self.ball_speed)
        if self.ball_direction == self.RIGHT:
            self.ball_pos[0] = self.ball_pos[0] + dx
            self.ball_pos[1] = self.ball_pos[1] - dy
        if self.ball_direction == self.LEFT:
            self.ball_pos[0] = self.ball_pos[0] - dx
            self.ball_pos[1] = self.ball_pos[1] + dy

    def restart(self):
        self.__init__()
