import unittest
from app import app

class FlaskAppTests(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True 

    # 检查首页是否返回 200 状态码
    def test_home_status_code(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)

    # 检查首页是否包含预期的文本
    def test_home_data(self):
        response = self.app.get('/')
        self.assertIn(b'Hello, DevOps World!', response.data)

if __name__ == '__main__':
    unittest.main()