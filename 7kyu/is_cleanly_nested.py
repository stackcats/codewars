def is_cleanly_nested(arr):
    if arr == []:
        return True

    if all(x == [] for x in arr):
        return True

    if any(x == [] for x in arr):
        return False

    return all(is_cleanly_nested(x) for x in arr)
