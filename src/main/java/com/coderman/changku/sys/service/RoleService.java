package com.coderman.changku.sys.service;

import com.coderman.changku.sys.commons.Page;
import com.coderman.changku.sys.modal.Role;
import com.coderman.changku.sys.vo.RoleVo;

public interface RoleService {
    /**
     * 查询角色信息
     * @param roleVo
     * @param pageNo
     * @param pageSize
     * @return
     */
    Page<Role> findPage(RoleVo roleVo,int pageNo,int pageSize);

    /**
     * 更新 角色信息
     * @param role
     */
    public void update(Role role);

    /**
     * 删除角色信息
     * @param id
     */
    public void delete(Integer id);

    /**
     * 添加觉信息
     * @param role
     */
    void save(Role role);
}
