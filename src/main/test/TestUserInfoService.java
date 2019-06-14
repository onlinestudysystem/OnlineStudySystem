import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.service.UserInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
//@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestUserInfoService {
//    //注册
//    public int registUserInfo(UserInfo userInfo);
    @Resource
    UserInfoService userInfoServiceImpl;
    @Test
    public  void registUserInfo(){
        UserInfo userInfo=new UserInfo();
        userInfo.setPassword("1234567");
        userInfo.setUsername("13272611231235");
        userInfo.setNikeName("qqqqqqqqqqq");
        userInfo.setName("asdasd");
        userInfo.setPreviledge(0);
        userInfo.setSex("男");
        userInfo.setDetail("asdasd");
        userInfo.setEmail("123123@qq,con");
        System.out.println(userInfoServiceImpl.registUserInfo(userInfo));

    }
}
