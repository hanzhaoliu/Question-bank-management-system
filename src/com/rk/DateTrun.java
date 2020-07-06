package com.rk;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTrun {

    public static Timestamp getNowTime(){
        Date date = new Date();//获得系统时间. 
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp goodsC_date = Timestamp.valueOf(nowTime);//把时间转换 
        return goodsC_date;
    }

}
