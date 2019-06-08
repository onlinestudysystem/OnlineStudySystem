package com.onlineStudySystem.service.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.*;
import org.springframework.stereotype.Service;
import org.apache.log4j.*;
import sun.rmi.runtime.Log;

@Aspect
@Service
public class DataBaseAffairAop {
    private static Logger logger= Logger.getLogger(DataBaseAffairAop.class);

    @Pointcut("execution(* com.onlineStudySystem.service.*.*(..))")
    public void pointcut(){}

    @Before("pointcut()")
    public void beforOperate(JoinPoint joinPoint){

        logger.info("aop-beforOperate:"+joinPoint.getSignature());



    }

    @After("pointcut()")
    public void afterOperate(JoinPoint joinPoint){
        logger.info("aop-afterOperate:"+joinPoint.getSignature());
    }

    @AfterReturning("pointcut()")
    public void afterReturning(JoinPoint joinPoint){
        logger.info("aop-afterReturningOperate-success:"+joinPoint.getSignature());

    }

    @AfterThrowing("pointcut()")
    public void afterThrowingOperate(JoinPoint joinPoint){
        logger.info("aop-afterThrowingOperate-error:"+joinPoint.getSignature());
    }



}
