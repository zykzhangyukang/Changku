package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.modal.Notice;
import com.coderman.changku.sys.vo.NoticeVo;

import java.util.List;

public interface NoticeService {
    /**
     * 查询公告
     * @param noticeVo
     * @param pageNo
     * @param PageSize
     * @return
     */
    Page<Notice> findPage(NoticeVo noticeVo,Integer pageNo,Integer PageSize);

    /**
     * 删除公告
     * @param id
     */
    void delete(Integer id);

    /**
     * 批量删除
     * @param list
     */
    void batchDelete(List<Integer> list);

    /**
     * 添加公告
     * @param notice
     */
    void save(Notice notice);

    /**
     * 更新公告
     * @param notice
     */
    void update(Notice notice);
}
