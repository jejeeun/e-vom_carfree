package kr.co.ejsoft.cims.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

public class DateUtil {
    /**
     * 현재시간
     * @return
     */
    public static String getNowDateTime() {
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return GlobalDeclaration.DATE_TIME_FORMAT_YYYYMMDDHHMMSS.format(cal.getTime());
    }
    /**
     * 현재시간(포맷지정)
     * @return
     */
    public static String getNowDateTime(SimpleDateFormat format) {
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return format.format(cal.getTime());
    }

    /**
     * 이번달 시작일과 종료일
     * @return String[0] : 시작일자(YYYYMMDD), String[1] : 종료일자(YYYYMMDD), String[2] : 종료일자(DD)(이번달 총 일 수) 
     */
    public static String[] getThisMonthDaysByStartAndEnd() {
        Date date = new Date();
        String[] days = new String[3];

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.DATE,  cal.getMinimum(Calendar.DAY_OF_MONTH));
        days[0] = GlobalDeclaration.DATE_FORMAT_YYYY_MM_DD.format(cal.getTime());
        cal.set(Calendar.DATE,  cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        days[1] = GlobalDeclaration.DATE_FORMAT_YYYY_MM_DD.format(cal.getTime());
        days[2] = Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return days;
    }

    /**
     * 지난달 시작일과 종료일
     * @return String[0] : 시작일자(YYYYMMDD), String[1] : 종료일자(YYYYMMDD), String[2] : 종료일자(DD)(이번달 총 일 수)
     */
    public static String[] getLastMonthDaysByStartAndEnd() {
        Date date = new Date();
        String[] days = new String[3];

        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.MONTH, -1);
        cal.set(Calendar.DATE,  cal.getMinimum(Calendar.DAY_OF_MONTH));
        days[0] = GlobalDeclaration.DATE_FORMAT_YYYY_MM_DD.format(cal.getTime());
        cal.set(Calendar.DATE,  cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        days[1] = GlobalDeclaration.DATE_FORMAT_YYYY_MM_DD.format(cal.getTime());
        days[2] = Integer.toString(cal.getActualMaximum(Calendar.DAY_OF_MONTH));
        return days;
    }

    public static int getTodayToInt() {
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        return Integer.parseInt(GlobalDeclaration.DATE_FORMAT_YYYYMMDD.format(cal.getTime()));
    }

    /**
     * 현재 시간에서 두시간 전
     * @return
     */
    public static String getTwoHourBeforDateTimeByNow() {

        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR,  -2);

        return GlobalDeclaration.DATE_TIME_FORMAT_YYYYMMDDHHMMSS.format(cal.getTime());
    }

    /**
     * N 시간 전
     * @param hour
     * @return
     */
    public static String getNHourBeforDateTimeByNow(int hour) {

        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.HOUR,  -hour);

        return GlobalDeclaration.DATE_TIME_FORMAT_YYYYMMDDHHMMSS.format(cal.getTime());
    }

    public static List<String> getLastWeek(){

        List<String> list = new LinkedList<>();

        for(int i = 0 ; i < 7 ; i ++)   {
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.DAY_OF_MONTH, -(6-i));
            String s = GlobalDeclaration.DATE_FORMAT_YYYY_MM_DD.format(calendar.getTime());
            list.add(s);
        }

        return list;
    }
}
