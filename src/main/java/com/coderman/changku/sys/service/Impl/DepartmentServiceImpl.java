package com.coderman.changku.sys.service.Impl;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.mapper.DepartmentMapper;
import com.coderman.changku.sys.modal.Department;
import com.coderman.changku.sys.modal.DepartmentExample;
import com.coderman.changku.sys.service.DepartmentService;
import com.coderman.changku.sys.vo.DepartmentVo;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> listAll() {
        return departmentMapper.selectByExample(null);
    }

    @Override
    public Page<Department> findPage(DepartmentVo departmentVo, Integer pageNo, int pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        DepartmentExample departmentExample = createDepartmentExample(departmentVo);
        List<Department> departments = departmentMapper.selectByExample(departmentExample);
        com.github.pagehelper.Page<Department> departmentPage= (com.github.pagehelper.Page<Department>) departments;
        return new Page<>(departmentPage.getTotal(),departmentPage.getResult());
    }

    @Override
    public void delete(Integer id) {
        departmentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void update(Department department) {
        departmentMapper.updateByPrimaryKeySelective(department);
    }

    @Override
    public void save(Department department) {
        departmentMapper.insertSelective(department);
    }

    /**
     * 封装部门的查询对象
     * @param departmentVo
     * @return
     */
    private DepartmentExample createDepartmentExample(DepartmentVo departmentVo) {
        DepartmentExample departmentExample = new DepartmentExample();
        departmentExample.setOrderByClause("ordernum");
        DepartmentExample.Criteria criteria = departmentExample.createCriteria();
        DepartmentExample.Criteria criteria2=departmentExample.createCriteria();
        if(departmentVo!=null){
            if(departmentVo.getTitle()!=null&&!"".equals(departmentVo.getTitle())){
                criteria.andTitleLike("%"+departmentVo.getTitle()+"%");
            }
            if(departmentVo.getAddress()!=null&&!"".equals(departmentVo.getAddress())){
                criteria.andAddressLike("%"+departmentVo.getAddress()+"%");
            }
            if(departmentVo.getRemark()!=null&&!"".equals(departmentVo.getRemark())){
                criteria.andRemarkLike("%"+departmentVo.getRemark()+"%");
            }
            if(departmentVo.getId()!=null&&!"".equals(departmentVo.getId())){
                criteria.andIdEqualTo(departmentVo.getId());
                criteria2.andPidEqualTo(departmentVo.getId());
            }
            departmentExample.or(criteria2);
        }
        return departmentExample;
    }
}
