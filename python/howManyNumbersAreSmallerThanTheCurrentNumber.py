class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        #create a hashmap
        mem = dict()
        #loop over the sorted list nums with an index
        for ind, x in enumerate(sorted(nums)):
            #if x isn't already in mem, add it
            #since its already sorted in ascending order
            #and we're skipping things already in mem, the index is representative
            #of the numbers that they key is greater than
            if x not in mem:
                mem[x] = ind
        #for each in nums, return the value in dict in a list.
        return [mem[x] for x in nums]