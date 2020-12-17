from numba.pycc import CC

cc = CC('utils')


@cc.export('add', 'i4(i4, i4)')
def add(a: int, b: int) -> int:
    return a + b


if __name__ == "__main__":
    cc.compile()
