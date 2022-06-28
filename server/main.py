#!/usr/bin/python3
from crypt import methods
import time
import base64
from flask import Flask, request, jsonify, send_file
from utils.ease import Ease
from utils import config
from utils.tool import Tool
from dao.sql import Sql

app = Flask(__name__)

codeList = ["000000"]


@app.route("/signup/sendCode", methods=["POST"])
def sendCodeHandler():
    code = Tool().generateCode()
    codeList.append(code)
    if Ease().sendSMS(config.SIGNUP_ID, request.json["phone"], code).status_code == 200:
        return "success"
    else:
        return "failed"


@app.route("/signup", methods=["POST"])
def signupHandler():
    name = request.json["name"]
    phone = request.json["phone"]
    code = request.json["code"]
    password = request.json["password"]
    if not code in codeList:
        print("验证码错误")
        return "验证码错误"
    if Sql().hasPhone(phone):
        print("手机号存在")
        codeList.remove(code)
        return "该手机号已被注册"
    Sql().addUser(name, phone, password)
    return "success"


@app.route("/signin", methods=["POST"])
def signinHandler():
    phone = request.json["phone"]
    password = request.json["password"]
    if userId := Sql().checkUser(phone, password):
        return userId
    else:
        return "fail"


@app.route("/user/name", methods=["POST"])
def userNameHandler():
    id = request.json["id"]
    return Sql().findUserName(id)


@app.route("/leave/ask", methods=["POST"])
def leaveAskHandler():
    host = request.json["host"]
    type = request.json["type"]
    detail = request.json["detail"]
    startTime = request.json["startTime"]
    endTime = request.json["endTime"]
    if (to := Sql().findTo(host)) == None:
        return "fail"
    else:
        Sql().addLeave(host, detail, startTime, endTime, to, type)
        return "success"


@app.route("/bill/ask", methods=["POST"])
def billAskHandler():
    host = request.json["host"]
    type = request.json["type"]
    detail = request.json["detail"]
    image = request.json["image"]
    if (to := Sql().findTo(host)) == None:
        return "fail"
    else:
        file_name = str(int(time.time()*1000)) + ".jpg"
        with open("/home/chen/ProcessManagement/images/"+file_name, "wb") as f:
            f.write(base64.b64decode(image))
        Sql().addBill(host, detail, to, type, file_name)
        return "success"


@app.route("/work/ask", methods=["POST"])
def workAskHandler():
    host = request.json["host"]
    city = request.json["city"]
    detail = request.json["detail"]
    startTime = request.json["startTime"]
    endTime = request.json["endTime"]
    if (to := Sql().findTo(host)) == None:
        return "fail"
    else:
        Sql().addWork(host, detail, startTime, endTime, to, city)
        return "success"


@app.route("/leave/list", methods=["POST"])
def leaveListHandler():
    host = request.json["host"]
    results = []
    for each in Sql().listLeave(host):
        results.append({
            "id": each[0],
            "detail": each[1],
            "startTime": each[2],
            "endTime": each[3],
            "to": each[4],
            "type": each[5],
            "status": each[6],
        })
    return jsonify({"data": results})


@app.route("/bill/list", methods=["POST"])
def billListHandler():
    host = request.json["host"]
    results = []
    for each in Sql().listBill(host):
        results.append({
            "id": each[0],
            "detail": each[1],
            "to": each[2],
            "type": each[3],
            "status": each[4],
            "image": each[5]
        })
    return jsonify({"data": results})


@app.route("/work/list", methods=["POST"])
def workListHandler():
    host = request.json["host"]
    results = []
    for each in Sql().listWork(host):
        results.append({
            "id": each[0],
            "detail": each[1],
            "name": each[2],
            "startTime": each[3],
            "endTime": each[4],
            "city": each[5],
            "status": each[6]
        })
    return jsonify({"data": results})


@app.route("/member/list", methods=["POST"])
def listMemberHandler():
    host = request.json["host"]
    results = []
    for each in Sql().listMember(host):
        results.append(each[0])
    return jsonify({"data": results})


@app.route("/member/phone", methods=["POST"])
def memberPhoneHandler():
    phone = request.json["phone"]
    if not (id := Sql().hasPhone(phone)):
        return "False"
    else:
        return str(id)


@app.route("/member/invite", methods=["POST"])
def memberInviteHandler():
    host = request.json["host"]
    target = request.json["target"]
    Sql().addInvite(host, target)
    return "success"


@app.route("/notification/list", methods=["POST"])
def notificationListHandler():
    id = request.json["id"]
    results = []
    for each in Sql().listNotication(id):
        results.append({
            "id": each[0],
            "host": each[1],
            "status": each[2],
            "hostId": each[3],
        })
    return jsonify({"data": results})


@app.route("/invite/changStatus", methods=["POST"])
def changeInviteStatusHandler():
    id = request.json["id"]
    status = request.json["status"]
    host = request.json["host"]
    target = request.json["target"]
    Sql().changeInviteStatus(id, status)
    if status == 1:
        Sql().addMember(host, target)
    return "success"


@app.route("/leave/askList", methods=["POST"])
def leaveAskListHandler():
    id = request.json["id"]
    results = []
    for each in Sql().getLeaveAsk(id):
        results.append(
            {
                "id": each[0],
                "name": each[1],
                "detail": each[2],
                "startTime": each[3],
                "endTime": each[4],
                "type": each[5],
                "status": each[6]
            }
        )
    return jsonify({"data": results})


@app.route("/bill/askList", methods=["POST"])
def billAskListHandler():
    id = request.json["id"]
    results = []
    for each in Sql().getBillAsk(id):
        results.append({
            "id": each[0],
            "name": each[1],
            "detail": each[2],
            "type": each[3],
            "status": each[4],
            "image": each[5]
        })
    return jsonify({"data": results})


@app.route("/work/askList", methods=["POST"])
def workAskListHandler():
    id = request.json["id"]
    results = []
    for each in Sql().getWorkAsk(id):
        results.append({
            "id": each[0],
            "name": each[1],
            "detail": each[2],
            "startTime": each[3],
            "endTime": each[4],
            "city": each[5],
            "status": each[6],
        })
    return jsonify({"data": results})


@app.route("/leave/changeStatus", methods=["POST"])
def changeLeaveStatusHandler():
    id = request.json["id"]
    status = request.json["status"]
    Sql().changeLeaveStatus(id, status)
    return "success"


@app.route("/bill/changeStatus", methods=["POST"])
def changeBillStatusHandler():
    id = request.json["id"]
    status = request.json["status"]
    Sql().changeBillStatus(id, status)
    return "success"


@app.route("/work/changeStatus", methods=["POST"])
def changeWorkStatusHandler():
    id = request.json["id"]
    status = request.json["status"]
    Sql().changeWorkStatus(id, status)
    return "success"


@app.route("/image/<image>", methods=["GET"])
def imageHandler(image):
    imagePath = f"/home/chen/ProcessManagement/images/{image}"
    return send_file(imagePath, mimetype='image/gif')


if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080, debug=True)
