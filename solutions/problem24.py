def permutation(i, prefix, suffix):
    if suffix == "":
        if i + 1 == 1000000:
            print prefix
            exit()

        return i+1

    for c in range(0, len(suffix)):
        new_prefix = prefix + suffix[c]
        new_suffix = suffix[:c] + suffix[c+1:]
        i = permutation(i, new_prefix, new_suffix)

    return i

permutation(0, "", "0123456789")
        
        
