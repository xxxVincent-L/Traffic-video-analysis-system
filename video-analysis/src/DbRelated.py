from pymysql import *
import json
import cv2

offense = {0: "Speeding", 1: "Parking", 2: "Retrograde", 3: "PressYellowLine", 4: "Light"}

id_counter = 0


# 读取信息

def load_data(info2store):

    record = []
    IllegalID = []
    license = []
    local_url = []
    IllegalDate = []
    IllegalAddress = []

    IllegalID_counter = info2store["id_counter"]

    # 违法条目
    for index in info2store.keys():
        if index == "video_path" or index == "id_counter":
            continue

        # ID
        IllegalID_counter += 1
        global id_counter
        id_counter = IllegalID_counter

        IllegalID.append(str("I" + str(IllegalID_counter)))

        # Record
        record.append(str(offense[info2store[index]["record"]]))

        # Time
        increment_time = info2store[index]["increment_time"]  # 单位是秒
        increment_hour = int(increment_time / 3600)
        increment_minute = int(increment_time % 3600 / 60)
        increment_second = int(increment_time % 60)

        # video_path = "F:\\Pycharm\\CarProject\\2021-11-22_04-19-31_S001-1.png"  # 以函数参数加入

        print("===============")

        video_path = info2store["video_path"]

        date = video_path.split("\\")[-1].split("_")[0]
        second = int(video_path.split("\\")[-1].split("_")[1].split("-")[2]) + increment_second
        hour = int(video_path.split("\\")[-1].split("_")[1].split("-")[0]) + increment_hour
        minute = int(video_path.split("\\")[-1].split("_")[1].split("-")[1]) + increment_minute

        if second > 60:
            second = second % 60
            minute += 1
        if minute > 60:
            minute = minute % 60
            hour += 1

        if second < 10:
            second = str(0) + str(second)
        else:
            second = str(second)

        if minute < 10:
            minute = str(0) + str(minute)
        else:
            minute = str(minute)

        if hour < 10:
            hour = str(0) + str(hour)
        else:
            hour = str(hour)

        # print(second)
        # print(minute)
        # print(hour)
        # IllegalDate = str(date + ' ' + hour + ':' + minute + ':' + second)
        temp_date = str(date + ' ' + hour + ':' + minute + ':' + second)
        IllegalDate.append(temp_date)
        # print(IllegalDate)

        temp_address = str(video_path.split("\\")[-1].split("_")[-1].split(".")[0].split("-")[0])
        IllegalAddress.append(temp_address)

        # 图片
        # test
        # image = cv2.imread("frame/Category-1/1.png")
        # original_image = image

        original_image = info2store[index]["image"]

        name = temp_date.split(":")[0] + "-" + temp_date.split(":")[1] + "-" + temp_date.split(":")[2] + ".png"

        localUrl = "C:\\\\Users\\\\Y\\\\Desktop\\\\project\\\\detection\\\\result\\\\" \
                   + temp_address + "\\\\" + name
        local_url.append(localUrl)
        print(localUrl)

        cv2.imwrite(localUrl, original_image)

        license.append(info2store[index]["license"] if 'license' in info2store[index] else NULL)
        print(license)

        CarDetain = '1'

        DetainDays = '2021-11-23 04:19:40'

        HandleStatus = '1'

    return record, IllegalID, license, local_url, \
           IllegalDate, IllegalAddress, CarDetain, DetainDays, HandleStatus


def connect_DB():
    db = connect(host='www.ylxteach.net', port=3366, db='xm02', user='vince', passwd='123456', charset='utf8')
    return db


def insert_DB(db, info2store):
    cursor = db.cursor()
    record, IllegalID, license, local_url, \
    IllegalDate, IllegalAddress, CarDetain, DetainDays, HandleStatus = load_data(info2store)

    lenOfIllegalRecord = len(record)
    print(lenOfIllegalRecord)
    for index in range(lenOfIllegalRecord):
        sql = "INSERT INTO xm02_illegal_record_file( IllegalID, CarNum, Remark, IllegalCase,IllegalDate, IllegalAddress, CarDetain,DetainDays, HandleStatus)\
         VALUES('" + IllegalID[index] + "','" + license[index] + "','" + local_url[index] + "','" + record[
            index] + "','" + IllegalDate[index] + "','" + IllegalAddress[
                  index] + "','" + CarDetain + "','" + DetainDays + "','" + HandleStatus + "');"
        cursor.execute(sql)
    print(sql)

    try:
        # cursor.execute('DELETE FROM persons')

        db.commit()
        return True
    except Exception as e:
        print(e)
        print(000)
        db.rollback()
    return False


def start_DB(info2store):
    db = connect_DB()
    print(info2store["video_path"])
    if insert_DB(db, info2store):
        print('成功插入数据')
        return id_counter
    else:
        print('插入记录失败')


