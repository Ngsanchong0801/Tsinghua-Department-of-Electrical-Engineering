import pygame
import random


class BirdGame:
    def __init__(self):
        pygame.init()
        self.width = 800
        self.height = 600
        self.screen = pygame.display.set_mode((self.width, self.height))
        self.clock = pygame.time.Clock()
        self.bird = Bird(self.screen)
        self.balls = BallManager(self.screen)
        self.score = Score(self.screen)
        self.is_game_over = False

    def run(self):
        pygame.mixer.init()
        pygame.mixer.music.load("/sound/bgm.mp3")
        pygame.mixer.music.play(-1, 0)

        while not self.is_game_over:
            self.clock.tick(200)
            self.handle_events()
            self.update()
            self.draw()

        self.show_game_over_screen()

    def handle_events(self):
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                self.is_game_over = True
            elif event.type == pygame.MOUSEBUTTONDOWN:
                if self.bird.rect.collidepoint(event.pos):
                    self.bird.is_pressed = True
            elif event.type == pygame.MOUSEBUTTONUP:
                self.bird.is_pressed = False
            elif event.type == pygame.MOUSEMOTION:
                if self.bird.is_pressed:
                    self.bird.move(event.pos)
            elif event.type in (pygame.KEYDOWN, pygame.KEYUP):
                if event.key in (pygame.K_RETURN, pygame.K_SPACE):
                    self.is_game_over = True
                elif event.key == pygame.K_UP:
                    self.bird.move_up(event.type == pygame.KEYDOWN)
                elif event.key == pygame.K_DOWN:
                    self.bird.move_down(event.type == pygame.KEYDOWN)
                elif event.key == pygame.K_LEFT:
                    self.bird.move_left(event.type == pygame.KEYDOWN)
                elif event.key == pygame.K_RIGHT:
                    self.bird.move_right(event.type == pygame.KEYDOWN)

    def update(self):
        if self.is_game_over:
            return

        self.bird.update()
        self.balls.update()
        self.check_collisions()

    def check_collisions(self):
        for ball in self.balls.ball_list:
            if self.bird.rect.colliderect(ball.rect):
                if ball.is_red:
                    self.balls.remove_ball(ball)
                    self.score.add_points(3)
                    pygame.mixer.Sound("/sound/succeed.wav").play()
                else:
                    self.is_game_over = True
                    pygame.mixer.Sound("/sound/bomb.wav").play()
                    break

    def draw(self):
        self.screen.fill((0, 0, 0))
        self.balls.draw()
        self.bird.draw()
        self.score.draw()
        pygame.display.flip()

    def show_game_over_screen(self):
        pygame.time.wait(500)
        game_over_text = pygame.font.SysFont("Song", 60).render("Final Scores: " + str(self.score.get_score()),
                                                                True, (255, 0, 0))
        game_over_rect = game_over_text.get_rect(center=(self.width // 2, self.height // 2))
        self.screen.blit(game_over_text, game_over_rect)
        pygame.display.flip()
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    pygame.quit()
                    exit()
                elif event.type == pygame.MOUSEBUTTONDOWN or event.type == pygame.KEYDOWN:
                    pygame.quit()
                    exit()


class Bird:
    def __init__(self, screen):
        self.image = pygame.transform.scale(pygame.image.load("/pic/bird.png"), (80, 60))
        self.rect = self.image.get_rect()
        self.rect.right = 100
        self.rect.top = 100
        self.screen = screen
        self.is_pressed = False
        self.step = [0, 0]

    def move(self, pos):
        x = pos[0] - self.rect.width / 2
        y = pos[1] - self.rect.height / 2
        self.rect.left = max(0, min(x, self.screen.get_width() - self.rect.width))
        self.rect.top = max(0, min(y, self.screen.get_height() - self.rect.height))

    def move_up(self, is_keydown):
        self.step[1] = -1 if is_keydown else 0

    def move_down(self, is_keydown):
        self.step[1] = 1 if is_keydown else 0

    def move_left(self, is_keydown):
        self.step[0] = -1 if is_keydown else 0

    def move_right(self, is_keydown):
        self.step[0] = 1 if is_keydown else 0

    def update(self):
        self.rect.move_ip(self.step[0] * 5, self.step[1] * 5)

    def draw(self):
        self.screen.blit(self.image, self.rect)


class Ball:
    def __init__(self, screen, is_red):
        self.image = pygame.transform.scale(pygame.image.load("/pic/red_ball.png"), (70, 70)) \
            if is_red else pygame.transform.scale(pygame.image.load("W:/Python/Project/pic/green_ball.png"), (70, 70))
        self.rect = self.image.get_rect()
        self.rect.left = random.randint(0, screen.get_width() - self.rect.width)
        self.rect.top = random.randint(0, screen.get_height() - self.rect.height)
        self.screen = screen
        self.is_red = is_red

    def update(self):
        self.rect.move_ip(0, 2)

    def draw(self):
        self.screen.blit(self.image, self.rect)


class BallManager:
    def __init__(self, screen):
        self.screen = screen
        self.ball_list = []
        self.spawn_timer = pygame.time.get_ticks()

    def update(self):
        if pygame.time.get_ticks() - self.spawn_timer > 2000:
            self.spawn_ball()
            self.spawn_timer = pygame.time.get_ticks()

        for ball in self.ball_list:
            ball.update()

    def spawn_ball(self):
        is_red = random.choice([True, False])
        ball = Ball(self.screen, is_red)
        self.ball_list.append(ball)

    def draw(self):
        for ball in self.ball_list:
            ball.draw()

    def remove_ball(self, ball):
        self.ball_list.remove(ball)


class Score:
    def __init__(self, screen):
        self.screen = screen
        self.score = 0
        self.font = pygame.font.SysFont("Song", 30)

    def add_points(self, points):
        self.score += points

    def get_score(self):
        return self.score

    def draw(self):
        score_text = self.font.render("Score: " + str(self.score), True, (255, 255, 255))
        self.screen.blit(score_text, (10, 10))


if __name__ == "__main__":
    game = BirdGame()
    game.run()