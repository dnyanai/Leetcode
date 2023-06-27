nums = [1,1,2,2]
for n in nums:
    i = abs(n) - 1
    nums[i] = -1 * abs(nums[i])
print(nums)

[i+1 for i,each in enumerate(nums) if each>0]   ##Ans