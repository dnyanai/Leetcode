string = "kayak"

print(all(string[i] == string[~i] for i in range(len(string)//2)))

(yield(string[i]) for i in range(len(string)//2))

print(string[~i] for i in range(len(string)//2))
