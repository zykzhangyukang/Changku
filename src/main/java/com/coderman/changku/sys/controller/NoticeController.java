package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.Notice;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.NoticeService;
import com.coderman.changku.sys.vo.NoticeVo;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 公告管理
 */
@RestController
@RequestMapping("/notice")
public class NoticeController {

    @Autowired
    private NoticeService noticeService;

    /**
     * 更新公告
     * @param notice
     * @return
     */
    @RequiresPermissions({"notice:update"})
    @PostMapping("/update")
    public ResultObj update(Notice notice){
        try {
            noticeService.update(notice);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 添加公告
     * @param notice
     * @return
     */
    @RequiresPermissions({"notice:add"})
    @PostMapping("/add")
    public ResultObj add(Notice notice){
        try {
            notice.setCreatetime(new Date(System.currentTimeMillis()));
            User user = (User) WebUtil.getSession().getAttribute("user");
            notice.setOpername(user.getName());
            noticeService.save(notice);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 查询
     * @param noticeVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listNotices")
    public Result listNotices(NoticeVo noticeVo,
                           @RequestParam(name = "page", required = false, defaultValue = "1") Integer pageNo,
                           @RequestParam(name = "limit", required = false, defaultValue = "20") int pageSize) {
        Page<Notice> page = noticeService.findPage(noticeVo, pageNo, pageSize);
        return new Result(page.getTotal(),page.getRows());
    }
    /**
     * 批量删除删除
     * @return
     */
    @RequiresPermissions({"notice:batchDelete"})
    @PostMapping("/batchDelete")
    public ResultObj batchDelete(String ids){
        List<Integer> list=new ArrayList<>();
        try {
            if(ids!=null&&ids.contains(",")){
                String[] idStrs = ids.split(",");
                for (String idStr : idStrs) {
                    list.add(Integer.parseInt(idStr));
                }
                noticeService.batchDelete(list);
            }else {
                noticeService.delete(Integer.parseInt(ids));
            }
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
        return ResultObj.DELETE_SUCCESS;
    }
    /**
     * 删除日志记录
     * @param id
     * @return
     */
    @RequiresPermissions({"notice:delete"})
    @PostMapping("/delete")
    public ResultObj deleteLoginfo(Integer id){
        try {
            noticeService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

}
