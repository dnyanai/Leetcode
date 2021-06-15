def decrement(number, requests):
    arr = []
    for i in requests:
        if i == '?':
            prev = 0
            bin_ = number

            while bin_:
                num = int(bin_)//10
                digit = int(bin_)%10
#                print('num:',num)
                prev = prev + digit
#                #print('prev',prev)
                bin_ = num
#                #print('number:',bin_)
            arr.append(prev)

        elif i == '-':
#            str(int(bin(number), base=2) - 1)
            print('pehela number:',number)
            number = bin(int(number, base=2)-1).replace('0b', '')
            print('number:',number)
    return arr

number = '10000'
requests = ['?', '-', '?','-','-','?']
print(decrement(number, requests))


## ? hai tho count the 1s in the binary number
## - hai tho convert the binary to decimal and then subtract 1, treat this as the new number