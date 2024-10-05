def generate_pattern(length):
    pattern = ''
    alpha_upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    alpha_lower = "abcdefghijklmnopqrstuvwxyz"
    digits = "0123456789"

    while len(pattern) < length:
        for upper in alpha_upper:
            for digit in digits:
                for lower in alpha_lower:
                    if len(pattern) < length:
                        pattern += upper + 'a' + digit + lower
                    else:
                        break

    return pattern[:length]

# Example: Create a pattern of 200 characters
pattern = generate_pattern(200)
print(pattern)
