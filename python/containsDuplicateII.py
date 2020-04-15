class Solution:
    def containsNearbyDuplicate(self, nums: List[int], k: int) -> bool:
        #dictionaries are sets
        dic = {}
        #index iterate nums
        for i, v in enumerate(nums):
            #if the value is in the dictionary and its index minus the distance of a value already in the dictionary is less than or equal to k...
            #return true.
            #otherwise, memorize this and continue.
            if v in dic and i - dic[v] <= k:
                return True
            dic[v] = i
        #if nothing found, return false
        return False