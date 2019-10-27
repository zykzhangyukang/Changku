package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.mapper.NoticeMapper;
import com.coderman.changku.sys.modal.Notice;
import com.coderman.changku.sys.modal.NoticeExample;
import com.coderman.changku.sys.service.NoticeService;
import com.coderman.changku.sys.vo.NoticeVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeServiceImpl implements NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    @Override
    public Page<Notice> findPage(NoticeVo noticeVo, Integer pageNo, Integer PageSize) {
        PageHelper.startPage(pageNo,PageSize);
        NoticeExample noticeExample = CreateNoticeExample(noticeVo);
        noticeExample.setOrderByClause("createtime desc");
        List<Notice> notices = noticeMapper.selectByExampleWithBLOBs(noticeExample);
        com.github.pagehelper.Page<Notice> page= (com.github.pagehelper.Page<Notice>) notices;
        return new Page<>(page.getTotal(),page.getResult());
    }

    @Override
    public void delete(Integer id) {
        noticeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void batchDelete(List<Integer> list) {
        NoticeExample example = new NoticeExample();
        example.createCriteria().andIdIn(list);
        noticeMapper.deleteByExample(example);
    }

    @Override
    public void save(Notice notice) {
        noticeMapper.insertSelective(notice);
    }

    @Override
    public void update(Notice notice) {
        noticeMapper.updateByPrimaryKeySelective(notice);
    }

    private NoticeExample CreateNoticeExample(NoticeVo noticeVo) {
        NoticeExample noticeExample = new NoticeExample();
        NoticeExample.Criteria criteria = noticeExample.createCriteria();
        if(noticeVo!=null){
            if(noticeVo.getTitle()!=null&&!"".equals(noticeVo.getTitle())){
                criteria.andTitleLike("%"+noticeVo.getTitle()+"%");
            }
            if(noticeVo.getOpername()!=null&&!"".equals(noticeVo.getOpername())){
                criteria.andOpernameLike("%"+noticeVo.getOpername()+"%");
            }
            if(noticeVo.getStartTime()!=null&&!"".equals(noticeVo.getStartTime())){
                criteria.andCreatetimeGreaterThan(noticeVo.getStartTime());
            }
            if(noticeVo.getEndTime()!=null&&!"".equals(noticeVo.getEndTime())){
                criteria.andCreatetimeLessThan(noticeVo.getEndTime());
            }
        }
        return noticeExample;
    }
}
