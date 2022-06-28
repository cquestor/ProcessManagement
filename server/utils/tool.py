import random

class Tool:
    def __init__(self):
        super()

    def generateCode(self):
        code = ""
        for _ in range(6):
            code += str(random.randint(0, 9))
        return code