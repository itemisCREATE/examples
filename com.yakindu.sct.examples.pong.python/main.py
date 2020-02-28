import pygame
from pong.pong_ui import PongUI
from pong.pong_game import PongGame
from pong_npc.pong_npc_statemachine import Pong_npc

if __name__ == "__main__":
    pong_game = PongGame()
    ui = PongUI(pygame, pong_game)
    pong_npc = Pong_npc()
    pong_npc.init()
    pong_npc.enter()

    def loop():
        pressed_up_w = False
        pressed_down_w = False
        while True:
            for event in pygame.event.get():
                if event.type is pygame.QUIT:
                    return False
                if event.type is pygame.KEYDOWN:
                    if event.key is pygame.K_w:
                        pong_game.move(pong_game.UP, pong_game.PLAYER_ONE)
                        pressed_up_w = True
                    if event.key is pygame.K_s:
                        pong_game.move(pong_game.DOWN, pong_game.PLAYER_ONE)
                        pressed_down_w = True

            keys = pygame.key.get_pressed()
            if pressed_up_w:
                pressed_up_w = False
            else:
                if keys[pygame.K_w]:
                    pong_game.move(pong_game.UP, pong_game.PLAYER_ONE)

            if pressed_down_w:
                pressed_down_w = False
            else:
                if keys[pygame.K_s]:
                    pong_game.move(pong_game.DOWN, pong_game.PLAYER_ONE)
            
            pong_npc.sci_ball.direction = pong_game.ball_direction
            pong_npc.sci_ball.position = pong_game.ball_pos[1] + PongUI.BALL_RADIUS/2
            pong_npc.sci_player.position = pong_game.player2_position + PongUI.PLAYER_HEIGHT / 2
            
            print(pong_npc.sci_player.position)
            
            pong_npc.run_cycle()
            
            if(pong_npc.sci_interface.is_raised_up()):
                pong_game.move(pong_game.UP, pong_game.PLAYER_TWO)
            if(pong_npc.sci_interface.is_raised_down()):
                pong_game.move(pong_game.DOWN, pong_game.PLAYER_TWO)
            
            pong_game.update_ball()
            ui.update()

    loop()
    pygame.quit()
