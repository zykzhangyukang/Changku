package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.modal.Department;
import com.coderman.changku.sys.vo.DepartmentVo;

import java.util.List;

public interface DepartmentService {
    /**
     * 显示所有的部门
     * @return
     */
    public List<Department> listAll();

    /**
     * 查询部门
     * @param departmentVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<Department> findPage(DepartmentVo departmentVo, Integer pageNo, int pageSize);

    /**
     * 删除部门
     * @param id
     */
    void delete(Integer id);

    /**
     * 更新部门信息
     * @param department
     */
    void update(Department department);

    /**
     * 添加部门
     * @param department
     */
    void save(Department department);
}
