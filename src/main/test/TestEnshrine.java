
import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.service.EnshrineService;
import com.oracle.webservices.internal.api.EnvelopeStyle;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
//@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestEnshrine {

    @Resource
    EnshrineService enshrineService;

    @Test
    public void queryAllEnshrine(){
        System.out.println(enshrineService.queryAllEnshrinePapper("0001"));
    }

    @Test
    public void insert(){
        Enshrine enshrine=new Enshrine();
        enshrine.setPapperId("000002");
        enshrine.setUserId("0001");
        enshrine.setPapperProfile("科技文章简述");
        enshrine.setTitle("第二行代码");
        System.err.println(enshrineService.enshrinePapper(enshrine));
    }



}
