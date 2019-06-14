package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.bean.Papper;
import com.onlineStudySystem.dao.EnshrineMapper;
import com.onlineStudySystem.service.EnshrineService;
import com.onlineStudySystem.util.CheckUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class EnshrineServiceImpl implements EnshrineService {
    @Resource
    EnshrineMapper enshrineMapper;

    /**
     * 添加收藏的文章，enshrine包装了添加的文章信息（需要你前端传参数自动装配到javabean再传像service的这个方法）
     *
     * @param enshrine
     * @return 是否添加成功，回馈给用户
     */
    public String enshrinePapper(Enshrine enshrine) {
        if(!CheckUtil.getInstance().checkIsEmpty(enshrine)){
            return "收藏信息丢失，请检查网络再重试！";
        }
        if(enshrineMapper.queryPapperById(enshrine.getPapperId(),enshrine.getUserId())>0)
            return "该文章已被收藏！";

        return enshrineMapper.enshrinePapper(enshrine)?"收藏成功":"收藏失败,请重试";
    }

    /**
     * 删除收藏文章
     *
     * @param papperId
     * @return
     */
    public String deleteEnshrinePapper(String papperId,String userId) {
        return   enshrineMapper.deleteEnshrinePapper(papperId,userId)?"删除成功":"删除失败，请刷新重试";
    }

    /**
     * 查询所有收藏的文章
     * @return
     */
    public List<Enshrine> queryAllEnshrinePapper(String userId) {
        return enshrineMapper.queryAllEnshrinePapper(userId);
    }

}
