class Solution:
    def reverse(self, x: int) -> int:
        """
        This one is amazing:
        if x is less than zero, this is true, or 1.
        if x is greater than zero, this is false or zero.
        [1,-1] is a representation of a list, and the comparison  [x < 0] is its index
        
        """
        sign = [1,-1][x < 0]
       
        """
        from inner to outer:
        1. take the absolute value of x
        2. turn it into a string
        3. reverse it using python slice shorthand LIST[::-1]
        4. turn it back into an integer
           this ends up eliminating any leading zeroes.
        5. multiply by the sign.
           they never mentioned eliminating the original sign, so this preserves it
        """
        rst = sign * int(str(abs(x))[::-1])
        #python can have giant integers that are outside of normal bounds.
        #we HAVE to manually do checks for out of bounds in python.
        #standard integers must fall within -2^31 -> 2^31-1
        return rst if -(2**31)-1 <= rst <= 2**31-1 else 0