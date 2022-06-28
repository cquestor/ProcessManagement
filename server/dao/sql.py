import pymysql
import os
import sys
sys.path.append(os.path.abspath(os.path.dirname(os.path.dirname(__file__))))
from utils import config


class Sql:
    def __init__(self):
        self.__host = config.SQL_HOST
        self.__user = config.SQL_USER
        self.__password = config.SQL_PASSWORD
        self.__database = config.SQL_DATABASE

    def __getConnect(self) -> pymysql.Connection:
        return pymysql.connect(host=self.__host, user=self.__user, password=self.__password, database=self.__database)

    def hasPhone(self, phone: str):
        """手机号是否存在
        :param: phone: 手机号
        :return: False不存在/True存在
        """
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT id FROM tb_user WHERE phone=%s"
        try:
            cursor.execute(sql, phone)
            result = cursor.fetchone()
            if result == None:
                return False
            else:
                return result[0]
        except:
            return True
        finally:
            db.close()

    def addUser(self, name, phone, password):
        """新增用户
        :param: name: 用户名
        :param: phone: 手机号
        :param: password: 密码
        """
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_user(name, phone, password) VALUES(%s, %s, %s)"
        try:
            cursor.execute(sql, (name, phone, password))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def checkUser(self, phone, password):
        """检查用户登录
        :param: phone: 手机号
        :param: password: 密码
        :return: True用户存在/False用户不存在
        """
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT * FROM tb_user WHERE phone=%s AND password=%s"
        try:
            result = cursor.execute(sql, (phone, password))
            if result != 0:
                return str(cursor.fetchone()[0])
            else:
                return False
        except:
            return False
        finally:
            db.close()

    def findUserName(self, id: int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT name FROM tb_user WHERE id=%s"
        try:
            result = cursor.execute(sql, (id,))
            if result != 0:
                return cursor.fetchone()[0]
        except:
            pass
        finally:
            db.close()

    def findTo(self, id: int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT host FROM tb_team WHERE member=%s"
        try:
            result = cursor.execute(sql, (id,))
            if result != 0:
                return cursor.fetchone()[0]
            else:
                return None
        except:
            return None
        finally:
            db.close()

    def addLeave(self, host: int, detail: str, startTime: str, endTime: str, to: int, type: int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_leave(host, detail, startTime, endTime, `to`, type) VALUES(%s, %s, %s, %s, %s, %s)"
        try:
            cursor.execute(sql, (host, detail, startTime, endTime, to, type))
            db.commit()
        except Exception as e:
            print(e)
            db.rollback()
        finally:
            db.close()

    def listLeave(self, id: int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_leave.id, detail, startTime, endTime, tb_user.name, `type`, `status` FROM tb_leave, tb_user WHERE tb_leave.host=%s AND tb_leave.to=tb_user.id"
        try:
            cursor.execute(sql, (id,))
            result = cursor.fetchall()
            return result
        except Exception as e:
            print(e)
        finally:
            db.close()

    def listBill(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_bill.id, detail, tb_user.name, `type`, `status`, image FROM tb_bill, tb_user WHERE tb_bill.host=%s AND tb_bill.to=tb_user.id"
        try:
            cursor.execute(sql, (id,))
            result = cursor.fetchall()
            return result
        except Exception as e:
            print(e)
        finally:
            db.close()

    def listWork(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_work.id, detail, tb_user.name, startTime, endTime, city, `status` FROM tb_work, tb_user WHERE tb_work.host=%s AND tb_work.to=tb_user.id"
        try:
            cursor.execute(sql, (id,))
            result = cursor.fetchall()
            return result
        except Exception as e:
            print(e)
        finally:
            db.close()

    def listMember(self, id: int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT `name` FROM tb_user, tb_team WHERE `host`=%s AND tb_team.member=tb_user.id"
        try:
            cursor.execute(sql, (id,))
            result = cursor.fetchall()
            return result
        except Exception as e:
            print(e)
        finally:
            db.close()

    def addInvite(self, host:int, target:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_notification(`host`, target) VALUES(%s, %s)"
        try:
            cursor.execute(sql, (host, target))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def listNotication(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_notification.id, tb_user.name AS `host`, tb_notification.status, tb_user.id as hostId FROM tb_notification, tb_user WHERE tb_notification.target=%s AND tb_notification.host=tb_user.id;"
        try:
            cursor.execute(sql, (id,))
            return cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            db.close()

    def changeInviteStatus(self, id:int, status:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "UPDATE tb_notification SET `status`=%s WHERE id=%s"
        try:
            cursor.execute(sql, (status, id))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def addMember(self, host:int, member:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_team(`host`, `member`) VALUES(%s, %s)";
        try:
            cursor.execute(sql, (host, member))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def getLeaveAsk(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_leave.id, tb_user.name, detail, startTime, endTime, `type`, `status` FROM tb_leave, tb_user WHERE tb_leave.to=%s AND tb_leave.host=tb_user.id"
        try:
            cursor.execute(sql, (id,))
            return cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            db.close()

    def getBillAsk(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "select tb_bill.id, tb_user.name, detail, `type`, `status`, image from tb_user, tb_bill where tb_bill.to=%s and tb_user.id=tb_bill.host"
        try:
            cursor.execute(sql, (id,))
            return cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            db.close()

    def getWorkAsk(self, id:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "SELECT tb_work.id, tb_user.name, detail, startTime, endTime, city, `status` FROM tb_work, tb_user WHERE tb_work.to=%s AND tb_work.host=tb_user.id;"
        try:
            cursor.execute(sql, (id,))
            return cursor.fetchall()
        except Exception as e:
            print(e)
        finally:
            db.close()

    def changeLeaveStatus(self, id:int, status:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "UPDATE tb_leave SET `status`=%s WHERE id=%s"
        try:
            cursor.execute(sql, (status, id))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def changeBillStatus(self, id:int, status:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "UPDATE tb_bill SET `status`=%s WHERE id=%s"
        try:
            cursor.execute(sql, (status, id))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def changeWorkStatus(self, id:int, status:int):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "UPDATE tb_work SET `status`=%s WHERE id=%s"
        try:
            cursor.execute(sql, (status, id))
            db.commit()
        except:
            db.rollback()
        finally:
            db.close()

    def addBill(self, host:int, detail:str, to:int, type:int, image:str):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_bill(`host`, detail, `to`, `type`, image) VALUES(%s, %s, %s, %s, %s)"
        try:
            cursor.execute(sql, (host, detail, to, type, image))
            db.commit()
        except Exception as e:
            db.rollback()
        finally:
            db.close()

    def addWork(self, host:int, detail:str, startTime:str, endTime:str, to:int, city:str):
        db = self.__getConnect()
        cursor = db.cursor()
        sql = "INSERT INTO tb_work(`host`, detail, startTime, endTime, `to`, city) VALUES(%s, %s, %s, %s, %s, %s)"
        try:
            cursor.execute(sql, (host, detail, startTime, endTime, to, city))
            db.commit()
        except Exception as e:
            print(e)
            db.rollback()
        finally:
            db.close()


if __name__ == '__main__':
    sql = Sql()
    sql.listMember(3)
