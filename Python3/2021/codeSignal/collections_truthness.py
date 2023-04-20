xs = [()]

res = [False]*2
#print(res)

if xs:
    print('1',xs)
    res[0] = True
if xs[0]:
    print('2', xs[0])
    res[1] = True

print(res)

print(xs[0])
