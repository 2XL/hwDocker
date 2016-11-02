import unittest
from mock import patch
import mockredis
import hitcount

"""
https://packagecontrol.io/packages/Unittest%20(python)

"""


class HitCountTest (unittest.TestCase):
    @patch('hitcount.r', mockredis.mock_strict_redis_client(host='0.0.0.0', port=6379, db=0))
    def testOneHit(self):
        # increase the hit count for user user1
        hitcount.hit("user1")
        # ensure that the hit count for user1 is just 1
        self.assertEqual(b'1', hitcount.get_hit("user1"))

if __name__ == '__main__':
    unittest.main()
