package com.coderman.changku.sys.controller;

import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.commons.Result;
import com.coderman.changku.sys.commons.TreeNode;
import com.coderman.changku.sys.entities.ResultObj;
import com.coderman.changku.sys.modal.Department;
import com.coderman.changku.sys.service.DepartmentService;
import com.coderman.changku.sys.vo.DepartmentVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * 部门管理
 */
@RestController
@RequestMapping("/dept")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    /**
     * 查询部门信息
     * @param departmentVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    @GetMapping("/listDepartments")
    public Result listLoginInfo(DepartmentVo departmentVo,
                                @RequestParam(name = "page",required = false,defaultValue = "1") Integer pageNo,
                                @RequestParam(name = "limit",required = false,defaultValue = "20") int pageSize){
        Page<Department> page= departmentService.findPage(departmentVo,pageNo,pageSize);
        return new Result(page.getTotal(),page.getRows());
    }
    /**
     * 加载部门树的json
     * @return
     */
    @PostMapping("/loadDeptTree")
    public Result loadDeptTree(){
        List<Department> departments = departmentService.listAll();
        List<TreeNode> treeNodes=new ArrayList<>();
        for (Department department : departments) {
            Boolean spread=department.getOpen()== Constast.OPEN_TRUE?true:false;
            treeNodes.add(new TreeNode(department.getId(),department.getPid(),department.getTitle(),spread));
        }
        return new Result(treeNodes);
    }

    /**
     * 添加部门信息
     * @param department
     * @return
     */
    @PostMapping("/add")
    public ResultObj add(Department department){
        try {
            department.setCreatetime(new Date(System.currentTimeMillis()));
            departmentService.save(department);
            return ResultObj.ADD_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.ADD_FAIL;
        }
    }
    /**
     * 更新部门信息
     * @param department
     * @return
     */
    @PostMapping("/update")
    public ResultObj update(Department department){
        try {
            departmentService.update(department);
            return ResultObj.UPDATE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.UPDATE_FAIL;
        }
    }
    /**
     * 删除部门
     * @param id
     * @return
     */
    @PostMapping("/delete")
    public ResultObj delete(Integer id){
        try {
            departmentService.delete(id);
            return ResultObj.DELETE_SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}
