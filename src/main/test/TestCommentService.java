
import com.onlineStudySystem.bean.CommentItem;
import com.onlineStudySystem.service.CommentItemService;
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
@Transactional()
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
@ContextConfiguration("classpath:spring-aop.xml")

public class TestCommentService {
    @Resource
    CommentItemService commentItemService;
    //查询
    @Test
    public void findCommentItem(){
        System.out.println(commentItemService.queryCommentInPapper("000001"));

    }
}
