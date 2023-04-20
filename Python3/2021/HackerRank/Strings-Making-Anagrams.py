"""
adict = {}
        bdict = {}

        alist = [chr for chr in a]

        blist = [chr for chr in b]

        for each in alist:
            adict[each] = alist.count(each)
            #print(adict)
        for each in blist:
            bdict[each] = blist.count(each)
            #print(blist)

        print(adict)
        print(bdict)

        print(sum(adict.values())+sum(bdict.values())-len((adict.keys() & bdict.keys())))
"""

def get_anagrams(a,b):
        a = a.strip()
        b = b.strip()
        opset = set(a+b)  ##concatenate a and b then take their set

        total = 0

        for each in range(len(opset)):
                acount = a.count(list(opset)[each])
                bcount = b.count(list(opset)[each])

                if acount > bcount:
                        main = acount - bcount
                elif bcount > acount:
                        main = bcount - acount
                else:
                        main = 0
                total += main
        return total


if __name__=="__main__":
        a = 'cde'
        b = 'abc'

        print(get_anagrams(a,b))