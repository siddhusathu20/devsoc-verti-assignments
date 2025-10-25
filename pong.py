import pygame, sys, random

screen_width = 800
screen_height = 600
ball_speed_x = 7 * random.choice((1, -1))
ball_speed_y = 7 * random.choice((1, -1))
player_speed = 0
opponent_speed = 0

def game_over():
    global ball_speed_x, ball_speed_y
    ball.center = (screen_width / 2, screen_height / 2)
    ball_speed_x *= random.choice((1, -1))
    ball_speed_y *= random.choice((1, -1))

def move_ball():
    global ball_speed_x, ball_speed_y

    ball.x += ball_speed_x
    ball.y += ball_speed_y

    if ball.top <= 0 or ball.bottom >= screen_height:
        ball_speed_y *= -1
    if ball.left <= 0 or ball.right >= screen_width:
        game_over()
    
    if ball.colliderect(player_paddle) or ball.colliderect(opponent_paddle):
        ball_speed_x *= -1

def move_player():
    player_paddle.y += player_speed

    if player_paddle.top <= 0:
        player_paddle.top = 0
    if player_paddle.bottom >= screen_height:
        player_paddle.bottom = screen_height

def move_opponent():
    opponent_paddle.y += opponent_speed

    if opponent_paddle.top <= 0:
        opponent_paddle.top = 0
    if opponent_paddle.bottom >= screen_height:
        opponent_paddle.bottom = screen_height

pygame.init()
clock = pygame.time.Clock()

screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("birb pong")

ball = pygame.Rect(screen_width/2 - 15, screen_height/2 - 15, 30, 30)
player_paddle = pygame.Rect(screen_width - 20, screen_height/2 - 70, 10, 140)
opponent_paddle = pygame.Rect(10, screen_height/2 - 70, 10, 140)

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            sys.exit()
        if event.type == pygame.KEYDOWN:
            if event.key == pygame.K_DOWN:
                player_speed += 7
            if event.key == pygame.K_UP:
                player_speed -= 7
            if event.key == pygame.K_s:
                opponent_speed += 7
            if event.key == pygame.K_w:
                opponent_speed -= 7
        if event.type == pygame.KEYUP:
            if event.key == pygame.K_DOWN:
                player_speed -= 7
            if event.key == pygame.K_UP:
                player_speed += 7
            if event.key == pygame.K_s:
                opponent_speed -= 7
            if event.key == pygame.K_w:
                opponent_speed += 7
    
    move_ball()
    move_player()
    move_opponent()
    
    screen.fill((0, 0, 0))
    pygame.draw.rect(screen, (0, 255, 255), player_paddle)
    pygame.draw.rect(screen, (0, 255, 255), opponent_paddle)
    pygame.draw.ellipse(screen, (0, 255, 255), ball)
    pygame.draw.aaline(screen, (0, 255, 255), (screen_width / 2, 0), (screen_width / 2, screen_height))

    pygame.display.flip()
    clock.tick(60)