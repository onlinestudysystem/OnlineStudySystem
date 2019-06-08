package com.onlineStudySystem.controller.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateConverter implements Converter<String, Date> {
    public Date convert(String source) {
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        Date date=null;
        System.err.println("***************"+source+"*****************converter-end");
        if(source!=null){
            try {
               date=simpleDateFormat.parse(source);
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        System.err.println("***************"+date+"*****************converter-end");
        return date;
    }
}
