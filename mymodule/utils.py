from numba import njit


@njit
def add(a: int, b: int) -> int:
    return a + b
