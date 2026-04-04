class Solution(object):
    def findMedianSortedArrays(self, nums1, nums2):
        """
        :type nums1: List[int]
        :type nums2: List[int]
        :rtype: float
        """
        nums3 = nums1 + nums2
        nums3.sort()
        if len(nums3) % 2 != 0:
            m = int(((len(nums3) + 1) / 2) - 1)
            median = nums3[m]
        elif len(nums3) % 2 == 0:
            m1 = int(((len(nums3) + 1) / 2) - 1)
            m2 = int((((len(nums3) + 1) / 2) + 1) - 1)
            median = (nums3[m1] + nums3[m2]) / 2.0
            
        return float(median)
        
