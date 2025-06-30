class MyPrimeGenerator:
    def __init__(self, min_value, max_value):
        self.min_value = min_value
        self.max_value = max_value

    def is_prime(self, num):
        if num < 2:
            return False
        for i in range(2, int(num ** 0.5) + 1):
            if num % i == 0:
                return False
        return True

    def __iter__(self):
        for num in range(self.min_value, self.max_value + 1):
            if self.is_prime(num):
                yield num

prime_generator = MyPrimeGenerator(10, 50)

print("範圍內的質數有:")
for prime in prime_generator:
    print(prime)