import requests
from . import config


class Ease:
    def __init__(self):
        super()

    def sendSMS(self, SMSType:str, phone:str, code:str):
        url = f"http://a1.easemob.com/{config.ORG_NAME}/{config.APP_NAME}/sms/send"
        headers = {
            'Content-Type': "application/json",
            'Authorization': f"Bearer {config.EASE_TOKEN}",
        }
        data = {
            'mobiles': [phone],
            'tid': SMSType,
            'tmap': {'p1': code}
        }
        response = requests.post(url, headers=headers, json=data)
        return response
