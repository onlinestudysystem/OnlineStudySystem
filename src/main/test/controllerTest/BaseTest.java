package controllerTest;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggerFactory;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration(value = "src/main/webapp")
@ContextConfiguration(locations = {"classpath:spring-aop.xml","classpath:spring-mvc.xml"})
@ComponentScan(basePackages = {"com.onlineStudySystem.service","com.onlineStudySystem.controller"})
@Transactional
@TransactionConfiguration(transactionManager = "transactionManager",defaultRollback = true)
public class BaseTest {
    public Logger logger=Logger.getLogger(BaseTest.class);
    //加载web环境
    @Autowired
    private WebApplicationContext webApplicationContext;
    //mockMvc用于模拟MVC
    protected MockMvc mockMvc;
    //模拟request请求
    protected MockHttpServletRequest request;
    //模拟response请求
    protected MockHttpServletResponse response;


    /**
     * 初始化SpringmvcController测试类环境
     */
    @Before
    public void setup(){
        mockMvc= MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }


    //校验Handler中的方法是否返回正确路径
    public String commonMockMethod(String url)throws Exception{
        ResultActions resultActions=mockMvc.perform(MockMvcRequestBuilders.get(url));
        MvcResult mvcResult=resultActions.andDo(MockMvcResultHandlers.print()).andExpect(MockMvcResultMatchers.status().isOk()).andReturn();
        String result=mvcResult.getResponse().getContentAsString();
        return result;
    }
}
