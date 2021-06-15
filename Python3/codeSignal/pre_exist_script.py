'''
Prefix String - given two string arrays A & B, find if all strings in B are prefixes of a
concatenation of strings in A. For example if A = {"one", "two", "three"} B = {"onetwo", "one"},
return True
'''

def pre_exist_script(a,b):

    for _ in b:
       for word in a:
               print(_ in word)


a = ['one','Two','three']
b = ['oneTwo','one']
print(pre_exist_script(a,b))

