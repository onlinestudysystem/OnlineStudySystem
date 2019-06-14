

import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.bean.UserInfo;
import com.onlineStudySystem.service.PapperService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.stereotype.Service;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")
public class TestPapperService {
        @Resource
         PapperService papperService;
        @Test
        public void testInsert(){
            Papper papper=new Papper();
            papper.setTitle("1");
            papper.setType("1");
//            papper.setAuthor(new UserInfo());
            papper.setEnshrineNumber(0);
            papper.setPapperId(UUID.randomUUID().toString());
            papper.setSubmitDate(new Date());
            papper.setAuthorId("0001");
            papper.setPapperProfile("1231");
            papper.setPapperText("123");
            papperService.submitPapper(papper);
        }


    //模糊查询，依靠文章标题
    @Test
    public void queryPapperInVagueByTitle() {
        System.out.println(papperService.queryPapperInVagueByTitle("三"));
    }

    @Test
    public void queryRecommendPapper(){
        System.out.println(papperService.queryRecommendPapper());
    }

    @Test
    public void delete(){
        System.out.println(papperService.deletePapper("000001"));
    }

    @Test
    public void queryPapperInId(){
        System.out.println(papperService.queryPapperById("000001"));
    }

    @Test
    public void queryPapperTodayType(){
        System.out.println(papperService.queryTodayPapperByType("热点新闻"));
    }






}
