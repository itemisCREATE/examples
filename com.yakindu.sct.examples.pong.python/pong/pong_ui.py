class PongUI:
    WHITE = (255, 255, 255)
    BLACK = (0, 0, 0)
    WINDOW_WIDTH = 1200
    WINDOW_HEIGHT = 700
    PLAYER_WIDTH = 20
    PLAYER_HEIGHT = 100
    PLAYER_OFFSET = 100
    BALL_RADIUS = 20
    SIZE = (WINDOW_WIDTH, WINDOW_HEIGHT)

    def __init__(self, pygame, pong_game):
        self.pygame = pygame
        self.window = pygame.display.set_mode(self.SIZE)
        self.timer = pygame.time.Clock()
        self.pong_game = pong_game
        self.rect_player1 = None
        self.rect_player2 = None

    def draw_player(self):
        self.rect_player1 = (self.PLAYER_OFFSET - self.PLAYER_WIDTH/2, self.pong_game.player1_position, self.PLAYER_WIDTH, self.PLAYER_HEIGHT)
        self.pygame.draw.rect(self.window, self.WHITE, self.rect_player1)

        self.rect_player2 = (
            self.WINDOW_WIDTH - self.PLAYER_OFFSET - self.PLAYER_WIDTH/2, self.pong_game.player2_position, self.PLAYER_WIDTH,
            self.PLAYER_HEIGHT)
        self.pygame.draw.rect(self.window, self.WHITE, self.rect_player2)

    def draw_ball(self):
        self.pygame.draw.circle(self.window, self.WHITE, self.pong_game.ball_pos, self.BALL_RADIUS)

    @staticmethod
    def get_starting_position():
        return PongUI.WINDOW_HEIGHT / 2 - PongUI.PLAYER_HEIGHT / 2

    def update(self):
        self.window.fill(self.BLACK)
        self.draw_player()
        self.draw_ball()
        self.pygame.display.update()
        self.timer.tick(30)

    def restart(self):
        self.__init__()
