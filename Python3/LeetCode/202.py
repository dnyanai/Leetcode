
##Trying out without str() and int()
def isHappy(n):
    l = set()
    while True:
        sol = 0
        while n>0:
            unit = n%10
            sol = sol + unit**2
            n = n//10
        n = sol

        if sol == 1:
            return True
        if sol in l:
            return False
        else:
            l.add(sol)
    return False

'''
## Getting the output using a list comprehension with type casts:

def isHappy(n):
    mySet = set()
    while n not in mySet:
        mySet.add(n)
        n = sum([int(x)**2 for x in str(n)])
        if n==1:
            return True
        else:
            return False

'''


n = int(input('Enter number:'))
#print(type(n))


print(isHappy(n))

