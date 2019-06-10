package com.onlineStudySystem.util;

import com.onlineStudySystem.bean.Papper;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;

/**
 * 用于判断javabean的值是否为空的工具类,采用单例模式
 */
public class CheckUtil {

    private CheckUtil(){}

    private static CheckUtil checkUtil=null;

    public static CheckUtil getInstance(){
        if(checkUtil==null){
             synchronized (CheckUtil.class){
                 if(checkUtil==null){
                     synchronized (CheckUtil.class){
                         checkUtil=new CheckUtil();
                         return checkUtil;
                     }
                 }
             }
        }
        return checkUtil;
    }


    //检测传进来的javabean类的属性值是否有空
    public  boolean checkIsEmpty(Object object){
        Class clazz=object.getClass();
        Method[]methods=clazz.getMethods();
        //判断clazz的类型
        if(object instanceof Papper){
            object=(Papper)object;
        }
        //检查methods中每个get方法
        for(Method m:methods){

            if(m.getName().contains("get")){
                //这里说明这个方法是getter方法
                try {
                    Object obj=m.invoke(object);
                    //检查obj是不是空值
                    if(obj==null&&checkIsPrimitiveType(m.getReturnType().toString())){
                        System.out.println(m.getName()+"为空！"+obj);
                        return false;
                    }
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e) {
                    e.printStackTrace();
                }
            }
        }
        return true;
    }

    private boolean checkIsPrimitiveType(String type_str){

        if(type_str.equals(String.class.toString()) ||type_str.equals("int") || type_str.equals(Integer.class.toString()) || type_str.equals(Boolean.class.toString())
        ||type_str.equals(Double.class.toString())||type_str.equals(int.class.toString())|| type_str.equals(double.class.toString())||type_str.equals(boolean.class.toString())||
        type_str.equals(float.class.toString())|| type_str.equals(Float.class.toString())){
            System.out.println(type_str+" is primitive");
            return true;
        }
        System.err.println(type_str+"is not primitive");
       return false;
    }

}
