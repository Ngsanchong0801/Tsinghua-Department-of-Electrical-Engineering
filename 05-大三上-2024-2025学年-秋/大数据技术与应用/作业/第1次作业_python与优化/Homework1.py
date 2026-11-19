import numpy as np
from scipy.optimize import linprog
from scipy.optimize import minimize

# 线性规划
c = [-3, -1, -3]
A = [[2, 1, 1], [1, 2, 3], [2, 2, 1]]
b = [2, 5, 6]
print("\n线性规划")

res = linprog(c, A_ub=A, b_ub=b, options={"disp": True})


# 非线性规划
# 定义目标函数
def objective_function(vars):
    x, y = vars
    return (x - 2) ** 2 + (y - 3) ** 2


# 定义约束条件
def constraint1(vars):
    x, y = vars
    return 5 - (x + y)  # x + y <= 5


def constraint2(vars):
    x = vars[0]
    return x  # x >= 0


def constraint3(vars):
    y = vars[1]
    return y  # y >= 0


# 初始猜测
initial_guess = [1, 1]

# 约束
constraints = [{'type': 'ineq', 'fun': constraint1},
               {'type': 'ineq', 'fun': constraint2},
               {'type': 'ineq', 'fun': constraint3}]

# 求解
result = minimize(objective_function, initial_guess, constraints=constraints)

# 四舍五入以显示更简洁的结果
optimal_solution = np.round(result.x, 6)  # 保留6位小数
objective_value = np.round(result.fun, 6)

# 输出结果
print("\n非线性规划")
print("对函数f(x,y)=(x−2)^2+(y−3)^2")
print("约束条件包括:\nx+y<=5\nx>=0\ny>=0")
print("最优解：", optimal_solution)
print("目标函数最小值：", objective_value)
