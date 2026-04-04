class Solution(object):
    def validPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """

        left = 0
        right = len(s) -1 
        result = []
        s = list(s)
        r = list(s)
        
        while left < right:
            if s[left] == s[right]:
                left += 1
                right -= 1
            else:
                s.pop(left)
                r.pop(right)
                if s == s[::-1] or r == r[::-1]:
                    return True
                return False
          
                
        return True
