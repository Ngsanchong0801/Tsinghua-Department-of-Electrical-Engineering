import pygame
import random
import sys
import os


def main():
    pygame.init()
    width = 800
    height = 600
    size = (width, height)
    screen = pygame.display.set_mode(size)  # 界面大小
    clock = pygame.time.Clock()  # 幀數
    pygame.display.set_caption('貪吃蛇')  # 標題

    # 背景圖片
    current_dir = "."
    bg_small = pygame.image.load(os.path.join(current_dir, "pic/background.png")).convert_alpha()
    bg_big = pygame.transform.scale(bg_small, (800, 600))

    # 食物图片
    goodfood = pygame.image.load(os.path.join(current_dir, "pic/GoldenAppleNew.png"))
    badfood = pygame.image.load(os.path.join(current_dir, "pic/RottenFleshNew.png"))
    scaled_goodfood = pygame.transform.scale(goodfood, (goodfood.get_width() // 2.9, goodfood.get_height() // 2.9))
    scaled_badfood = pygame.transform.scale(badfood, (goodfood.get_width() // 2.9, goodfood.get_height() // 2.9))

    # 背景音乐
    pygame.mixer.init()
    pygame.mixer.music.load(os.path.join(current_dir, "sound/snakegame.mp3"))
    pygame.mixer.music.set_volume(0.5)  # 设置音量
    pygame.mixer.music.play(-1, 0)

    # 音效
    bonus = pygame.mixer.Sound(os.path.join(current_dir, "sound/eat_Audio Trimmer.mp3"))
    bad = pygame.mixer.Sound(os.path.join(current_dir, "sound/bad_Audio Trimmer.mp3"))
    lose = pygame.mixer.Sound(os.path.join(current_dir, "sound/gameover_Audio Trimmer.mp3"))

    # 初始化时间
    start_time = pygame.time.get_ticks()

    # 初始化分數
    score = 0

    # 蛇和的初始移動方向
    snakeDirect = "left"

    # 遊戲是否結束
    gg = False

    # 壞食物生成間隔
    badfood_timer = 5

    # 地圖大小為12*16
    row = 12
    col = 16

    # 記錄蛇頭座標
    class Point:
        row = 0
        col = 0

        def __init__(self, row, col):
            self.row = row
            self.col = col

    # 蛇的初始座標
    headPoint = Point(int(row / 3), int(col / 2))

    # 生成蛇(頭和身體)的函數
    def drawRect(point, color):
        # 格子大小
        boxheight = height / row
        boxwidth = width / col

        # 格子座標
        box_head_left = point.col * boxwidth
        box_head_top = point.row * boxheight
        # 畫出格子
        pygame.draw.rect(screen, color, (box_head_left, box_head_top, boxwidth, boxheight))

    # 蛇身長度
    snakeBody = [
        Point(row=headPoint.row, col=headPoint.col + 1),
        # Point(row=headPoint.row, col=headPoint.col + 2),
        # Point(row=headPoint.row, col=headPoint.col + 3),
        # Point(row=headPoint.row, col=headPoint.col + 4),
    ]
    # 蛇身的颜色
    snakeBodyColor = (200, 200, 200)

    # 生成好食物的函數
    def creategoodFood(_headPoint, _snakeBody):
        while True:
            rfoodPoint = Point(random.randint(1, row - 2), random.randint(1, row - 2))
            isRepater = False
            # 判断食物是否与蛇头重叠
            if _headPoint.row == rfoodPoint.row and _headPoint.col == rfoodPoint.col:
                isRepater = True
                continue
            # 判断食物是否与蛇身重叠
            for item in _snakeBody:
                if item.col == rfoodPoint.col and item.row == rfoodPoint.row:
                    isRepater = True
                    continue
            # 都没有碰上則正常返回
            if isRepater == False:
                return rfoodPoint

    goodfoodPoint = creategoodFood(headPoint, snakeBody)
    goodfoodColor = (255, 255, 255)

    # 生成壞食物的函數
    def createbadFood(_headPoint, _snakeBody):
        while True:
            rfoodPoint = Point(random.randint(1, row - 2), random.randint(1, row - 2))
            isRepater = False
            # 判断食物是否与蛇头重叠
            if _headPoint.row == rfoodPoint.row and _headPoint.col == rfoodPoint.col:
                isRepater = True
                continue
            # 判断食物是否与蛇身重叠
            for item in _snakeBody:
                if item.col == rfoodPoint.col and item.row == rfoodPoint.row:
                    isRepater = True
                    continue
            # 都没有碰上則正常返回
            if isRepater == False:
                return rfoodPoint

    badfoodPoint = createbadFood(headPoint, snakeBody)
    badfoodColor = (255, 255, 255)

    # 是否暫停
    paused = False
    # 是否結束遊戲
    running = True

    # 主循環
    while running:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                running = False
            # 按鍵事件
            elif event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    snakeDirect = "left"
                elif event.key == pygame.K_RIGHT:
                    snakeDirect = "right"
                elif event.key == pygame.K_UP:
                    snakeDirect = "up"
                elif event.key == pygame.K_DOWN:
                    snakeDirect = "down"
                elif event.key == pygame.K_SPACE:
                    paused = not paused
        if not paused:
            # 白色界面
            pygame.draw.rect(screen, (255, 255, 255), (0, 0, width, height))
            screen.blit(bg_big, (0, 0))  # 背景图最先加载，坐标是(left, top)
            # 顯示遊戲進行時間
            current_time = pygame.time.get_ticks() - start_time
            seconds = current_time // 1000
            font = pygame.font.Font(None, 36)
            time_text = font.render("Time: " + str(seconds + 1) + " s", True, (0, 0, 0))
            time_rect = time_text.get_rect()
            time_rect.topright = (width - 30, 25)
            screen.blit(time_text, time_rect)

            # 總時間
            current_time = pygame.time.get_ticks()
            badfood_time_seconds = current_time // 1000
            if badfood_time_seconds >= badfood_timer:
                # 重新生成壞食物
                badfoodPoint = createbadFood(headPoint, snakeBody)

                # 更新壞食物生成时间
                badfood_timer = badfood_time_seconds + 5

            # 移動函數
            def snakeRun(snakeDirect):
                if snakeDirect == "left":
                    headPoint.col -= 1
                elif snakeDirect == "right":
                    headPoint.col += 1
                elif snakeDirect == "up":
                    headPoint.row -= 1
                elif snakeDirect == "down":
                    headPoint.row += 1

            # 碰撞到自己身體時結束遊戲
            for item in snakeBody:
                if headPoint.row == item.row and headPoint.col == item.col:
                    # 音效
                    lose.play()
                    gg = True

                    break

            if gg:
                # 結束遊戲
                running = False
                print("Game Over")

                # 顯示 "Game Over" 文字
                font = pygame.font.Font(None, 36)
                text = font.render("Game Over! Score:  " + str(score), True, (255, 0, 0))
                text_rect = text.get_rect(center=(width // 2, height // 2))
                screen.blit(text, text_rect)
                pygame.display.flip()

                # 靜止畫面
                while True:
                    for event in pygame.event.get():
                        if event.type == pygame.QUIT:
                            pygame.quit()
                            sys.exit()

            # 繪製蛇頭
            drawRect(headPoint, (77, 0, 153))

            # 繪製蛇身
            for item in snakeBody:
                drawRect(item, snakeBodyColor)

            # 吃好食物判斷
            if headPoint.row == goodfoodPoint.row and headPoint.col == goodfoodPoint.col:
                # 音效
                bonus.play()

                # 得分
                score += 1
                # 蛇長增加
                snakeBody.insert(0, Point(goodfoodPoint.row, goodfoodPoint.col))

                # 重新生成食物
                goodfoodPoint = creategoodFood(headPoint, snakeBody)

                # 更新蛇身座標
                snakeBody.insert(0, Point(headPoint.row, headPoint.col))
                snakeBody.pop()
            snakeBody.pop()

            # 吃壞食物判斷
            if headPoint.row == badfoodPoint.row and headPoint.col == badfoodPoint.col:
                # 音效
                bad.play()

                # 得分
                if score % 2 == 0:
                    score = score / 2
                else:
                    score = (score + 1) / 2

                # 蛇長減半
                snakeBody = snakeBody[:len(snakeBody) // 2]

                # 重新生成食物
                badfoodPoint = createbadFood(headPoint, snakeBody)

                # 更新蛇身座標
                snakeBody.insert(0, Point(headPoint.row, headPoint.col))
                snakeBody.pop()

            # 撞牆後從另一邊出現
            if headPoint.row < 0:
                headPoint.row = row - 1
            elif headPoint.row >= row:
                headPoint.row = 0
            elif headPoint.col < 0:
                headPoint.col = col - 1
            elif headPoint.col >= col:
                headPoint.col = 0

            # 蛇身跟隨蛇頭
            snakeBody.insert(0, Point(headPoint.row, headPoint.col))
            snakeRun(snakeDirect)

            # 繪製好食物
            boxheight = height / row
            boxwidth = width / col
            drawRect(goodfoodPoint, goodfoodColor)
            food_rect = goodfood.get_rect()
            food_rect.topleft = (goodfoodPoint.col * boxwidth, goodfoodPoint.row * boxheight)
            screen.blit(scaled_goodfood, food_rect)

            # 繪製壞食物
            boxheight = height / row
            boxwidth = width / col
            drawRect(badfoodPoint, badfoodColor)
            food_rect = goodfood.get_rect()
            food_rect.topleft = (badfoodPoint.col * boxwidth, badfoodPoint.row * boxheight)
            screen.blit(scaled_badfood, food_rect)

            # 設置幀數
            pygame.display.flip()
            clock.tick(6)


main()
