import pygame
import random

# 设置画面大小
pygame.init()
width = 800
height = 600
screen = pygame.display.set_mode((width, height))

# 设置背景
background_color_list = [(0, 0, 0), (0, 0, 255), (255, 0, 0), (0, 255, 0), (255, 255, 255)]
background_color_idx = 0

# 添加小乌
bird = pygame.image.load("W:/Python/Project/pic/bird.png")
bird_rect = bird.get_rect()
bird_rect.right = 100
bird_rect.top = 100

# 修改图片大小
bird = pygame.transform.scale(bird, (80, 60))

# 修改页面刷新频率
tick = 200
clock = pygame.time.Clock()

# 是否暂停
is_pause = False
# 是否按下
b_mouse_press = False

# 初始化移动步长
step = [0, 0]

# 初始化小球列表
ball_list = []
last_time = pygame.time.get_ticks()
# 得分
scores = 0
# 游戏结束
is_game_over = False

# 初始化字體
pygame.font.init()
score_font_size = 40
game_over_font_size = 60
score_font = pygame.font.SysFont("Song", score_font_size)
game_over_font = pygame.font.SysFont("Song", game_over_font_size)

# 顯示初始分數
score_text = score_font.render("Scores: " + str(scores), True, (255, 255, 255))
screen.blit(score_text, (10, 10))
pygame.display.flip()

# 背景音樂
pygame.mixer.init()
pygame.mixer.music.load("W:/Python/Project/sound/bgm.mp3")
pygame.mixer.music.play(-1, 0)

# 音效
write_sound = pygame.mixer.Sound("W:/Python/Project/sound/bomb.wav")
red_sound = pygame.mixer.Sound("W:/Python/Project/sound/succeed.wav")

while True:
    clock.tick(tick)
    b_quit = False

    screen.blit(score_text, (10, 10))
    # 小鳥運動
    x_step = 1
    y_step = 1


    # 添加对鼠标和键盘操作的应用
    for event in pygame.event.get():

        # 点击关闭按钮
        if event.type == pygame.QUIT:
            b_quit = True
            break

        # 小鸟跟随鼠标操作
        if event.type == pygame.MOUSEBUTTONDOWN:
            x = event.pos
            if bird_rect.collidepoint(x):
                b_mouse_press = True
        if event.type == pygame.MOUSEBUTTONUP:
            b_mouse_press = False
        if event.type == pygame.MOUSEMOTION:
            if b_mouse_press:
                x = event.pos[0] - bird_rect.width / 2
                y = event.pos[1] - bird_rect.height / 2
                bird_rect.left = max(0, min(x, width - bird_rect.width))
                bird_rect.top = max(0, min(y, height - bird_rect.height))

        # 按下回车键或空格键
        if event.type in {pygame.KEYDOWN, pygame.KEYUP}:
            press_dict = {pygame.K_UP: (0, -1), pygame.K_DOWN: (0, 1), pygame.K_LEFT: (-1, 0), pygame.K_RIGHT: (1, 0)}
            if event.key in (pygame.K_RETURN, pygame.K_SPACE):
                b_quit = True
                break
            move_flag = 1 if event.type == pygame.KEYDOWN else -1
            if event.key in press_dict:
                press = press_dict[event.key]
                step[0] += press[0] * move_flag
                step[1] += press[1] * move_flag

    if b_quit:
        break

    if is_game_over:
        continue

    # 生成小球
    this_time = pygame.time.get_ticks()
    if this_time - last_time > 500:
        last_time = this_time
        rand_val = random.randint(0, 10)
        is_red = rand_val <= 3

        if is_red:
            ball_body = pygame.image.load("W:/Python/Project/pic/red_ball.png")
        else:
            ball_body = pygame.image.load("W:/Python/Project/pic/ball.png")
        ball_rect = ball_body.get_rect()
        ball_rect.right = width
        ball_rect.top = random.randint(0, height - ball_rect.height)
        ball = {"body": ball_body, "rect": ball_rect, "red": is_red}
        ball_list.append(ball)

    for ball in ball_list:
        ball_rect = ball['rect']
        ball_rect.left -= 1
        if ball_rect.right <= 0:
            ball_list.remove(ball)
            scores += 1 if not ball['red'] else 0

    if scores < 0:
        is_game_over = True

    #是否碰撞
    b_collider = False
    for ball in ball_list:
        ball_rect = ball['rect']
        if bird_rect.colliderect(ball_rect):
            if ball['red']:
                ball_list.remove(ball)
                scores += 3
                red_sound.play()
            else:
                b_collider = True
                write_sound.play()
                is_game_over = True
            break

    bird_rect = bird_rect.move(step)

    # 填充背景色
    screen.fill(background_color_list[background_color_idx])

    screen.blit(score_text, (10, 10))
    # 绘制小球
    for ball in ball_list:
        ball_rect = ball['rect']
        ball_body = ball['body']
        screen.blit(ball_body, ball_rect)

    screen.blit(bird, bird_rect)
    pygame.display.flip()

    # 更新分数文本
    score_text = score_font.render("Scores: " + str(scores), True, (255, 255, 255))

    #碰撞後退出遊戲
    if is_game_over:
        pygame.time.wait(500)
        game_over_text = game_over_font.render("Final Scores: " + str(scores), True, (255, 0, 0))
        game_over_rect = game_over_text.get_rect(center=(width // 2, height // 2))
        screen.blit(game_over_text, game_over_rect)
        pygame.display.flip()
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    exit()
                elif event.type == pygame.MOUSEBUTTONDOWN or event.type == pygame.KEYDOWN:
                    pygame.quit()
                    exit()