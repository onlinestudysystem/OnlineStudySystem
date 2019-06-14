package controllerTest;
import com.onlineStudySystem.controller.UserHandler;
import com.onlineStudySystem.service.UserInfoService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.view.InternalResourceView;
import javax.annotation.Resource;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;
import static org.springframework.test.web.servlet.setup.MockMvcBuilders.standaloneSetup;


public class UserHanderTest extends BaseTest{
    @Resource
    UserInfoService userServiceImpl;
        /**
         *
         */
        @Test
        public  void testUserHandler ()throws  Exception {
            //模拟get请求
            String res=commonMockMethod("/user/login?username=13726273575&password=123456");
            System.out.println(res);
        }

        /**
         * 模拟用户登录
         */
        @Test
        public void testLogin()throws Exception{
            //模拟post请求
            UserHandler userHandler=new UserHandler(userServiceImpl);
            MockMvc mockMvc=standaloneSetup(userHandler).setSingleView(new InternalResourceView("/jsp/homePage.jsp")).build();
            mockMvc.
                    perform(post("/user/login").
                            param("username","13726273575").
                            param("password","123456")).andExpect(view().name("homePage"));
        }


    //注册客户
    @Test
    public void regist()throws Exception{
        UserHandler userHandler=new UserHandler(userServiceImpl);
        //设置视图，mock框架就不用解析控制器中的视图名了。
        MockMvc mockMvc=standaloneSetup(userHandler).setSingleView(new InternalResourceView("/jsp/login.jsp")).build();
        //请求/user/regist 匹配对应的控制器方法，然后期盼结果：
        //param后面是post请求的携带参数
        //1.view的name=spittles    2.model存在属性名为spittleList
        mockMvc.perform(post("/user/regist").param("username","123456").
                param("password","1233123122")
                .param("name", "asdasd").param("phone","12312312")
                .param("addr","beiging")
                .param("nikeName","qqqqq")
                .param("imageLogo","/static/images/grayBg.jpg")
        ).andExpect(view().name("login"));
    }





    }

//
//public class HomeControllerTest {
//
//
//
//  /*  @Test
//    public void testRegist() throws Exception {
////        String username, String password, String email, String detail
//        Spitter unsaved=new Spitter("haizhang","12345","2368521029@qq.com","eat!");
//        Spitter saved=new Spitter("haizhang","12345","2368521029@qq.com","eat!",123);
//        SpitterRepository spittleRepository=mock(SpitterRepository.class);
//        when(spittleRepository.save(unsaved)).thenReturn(saved);
//        SpitterController controller=new SpitterController(spitterRepository);
//
//        MockMvc mockMvc=standaloneSetup(controller).build();
//        mockMvc.perform(post("/spitter/register").
//                param("username","haizhang").param("password","12345")
//                .param("email","2368521029@qq.com").param("detail","eat!")
//        ).andExpect(redirectedUrl("/spitter/haizhang"));
//        //验证是否真的把结果装配到repository中
//        verify(spittleRepository,atLeastOnce()).save(unsaved);
//    }
//*/
//
////    @Test
////    public void testSendSpittle() throws Exception {
////        SpittleRepository spittleRepository=mock(SpittleRepository.class);
////        SpittleController controller=new SpittleController(spittleRepository);
////        MockMvc mockMvc=standaloneSetup(controller).build();
////        mockMvc.perform(post("/spittles/sendSpittle").param("message","").
////                param("latitude","123.2")
////        ).andExpect(redirectedUrl("sendSpittle"));
////
////
////    }
////
////    @Test
////    public void showSpittle() throws Exception {
////        Spittle expectedSpittle=new Spittle(12345L,"Hello",new Date());
////        SpittleRepository spittleRepository=mock(SpittleRepository.class);
////        when(spittleRepository.findOne(12345)).thenReturn(expectedSpittle);
////        SpittleController controller=new SpittleController(spittleRepository);
////        MockMvc mockMvc=standaloneSetup(controller).setSingleView(new InternalResourceView("/spittle.jsp")).build();
////        mockMvc.perform(get("/spittles/12345")).
////                andExpect(view().name("spittle")).
////                andExpect(model().attributeExists("spittle")).
////                andExpect(model().attribute("spittle",expectedSpittle));
////
////
////    }
////
////    private List<Spittle> createList(int count){
////        List<Spittle> spittles=new ArrayList<Spittle>();
////        for(int i=0;i<count;i++){
////            spittles.add(new Spittle(Long.parseLong(String.valueOf(i)),"Spittle"+i, new Date()));
////        }
////        return spittles;
////    }
//}

