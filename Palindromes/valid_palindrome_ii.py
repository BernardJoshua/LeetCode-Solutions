class Solution(object):
    def validPalindrome(self, s):
        """
        :type s: str
        :rtype: bool
        """

        for i in range(len(s)):
            new_s = s[:i] + s[i+1:]
            if new_s == new_s[::-1] and len(new_s) == len(s) - 1:
                return True
        return False
