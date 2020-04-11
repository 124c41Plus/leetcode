class Solution:
    def repeatedNTimes(self, A: List[int]) -> int:
      #creates a dictionary of key->count for list A
      count = collections.Counter(A)
      #iterate over this dictionary
      for k in count:
        #if the value on key > 1, return it.
          if count[k] > 1:
              return k