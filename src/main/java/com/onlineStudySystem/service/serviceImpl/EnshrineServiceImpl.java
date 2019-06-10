package com.onlineStudySystem.service.serviceImpl;

import com.onlineStudySystem.bean.Enshrine;
import com.onlineStudySystem.dao.EnshrineMapper;
import com.onlineStudySystem.service.EnshrineService;

import javax.annotation.Resource;
import java.util.List;

public class EnshrineServiceImpl implements EnshrineService {
    @Resource
    EnshrineMapper enshrineMapper;

    /**
     * 添加收藏的文章，enshrine包装了添加的文章信息（需要你前端传参数自动装配到javabean再传像service的这个方法）
     * @param enshrine
     * @return 是否添加成功，回馈给用户
     */
    public String enshrinePapper(Enshrine enshrine) {
        return null;
    }

    /**
     * 删除收藏文章
     * @param papperId
     * @return
     */
    public String deleteEnshrinePapper(String papperId) {
        return null;
    }

    /**
     * 查询所有收藏的文章
     * @return
     */
    public List<Enshrine> queryAllEnshrinePapper() {
        return null;
    }
}
