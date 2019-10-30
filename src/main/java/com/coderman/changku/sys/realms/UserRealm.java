package com.coderman.changku.sys.realms;

import com.coderman.changku.sys.commons.ActiveUser;
import com.coderman.changku.sys.commons.Constast;
import com.coderman.changku.sys.commons.WebUtil;
import com.coderman.changku.sys.modal.Permission;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.PermissionService;
import com.coderman.changku.sys.service.RoleService;
import com.coderman.changku.sys.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private PermissionService permissionService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @Override
    public String getName() {
        return this.getClass().getSimpleName();
    }

    /**用户授权的方法
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        UsernamePasswordToken upToken= (UsernamePasswordToken) authenticationToken;
        User user=userService.findUserByName(upToken.getUsername());
        if(null!=user){
            ActiveUser activeUser = new ActiveUser();
            activeUser.setUser(user);
            Object hashedCredentials=user.getPwd();
            ByteSource credentialsSalt = ByteSource.Util.bytes(user.getSalt());
            //根据用户id获取用户的角色
            List<Integer> currentUserRoleIds=roleService.findRoleIdsByUserId(user.getId());
            List<String> rNames = roleService.findNameByIds(currentUserRoleIds);
            activeUser.setRoles(rNames);
            //根据角色Id查询用户拥有的权限
            List<Permission> permissions=permissionService.findMenuByRids(currentUserRoleIds,Constast.PERMISSION_TYPE);
            if(permissions!=null&&permissions.size()>0){
                Set<String> percodes=new HashSet<>();
                for (Permission permission : permissions) {
                    percodes.add(permission.getPercode());
                }
                activeUser.setPermissions(new ArrayList<>(percodes));
            }
            return new SimpleAuthenticationInfo(activeUser,  hashedCredentials,  credentialsSalt, getName());
        }
        return null;
    }


    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
        ActiveUser activeUser=(ActiveUser) principalCollection.getPrimaryPrincipal();
        User user=activeUser.getUser();
        List<String> permissions = activeUser.getPermissions();
        if(user.getType()==0) {
            authorizationInfo.addStringPermission("*:*");
        }else {
            if(null!=permissions&&permissions.size()>0) {
                authorizationInfo.addStringPermissions(permissions);
            }
        }
        return authorizationInfo;
    }
}
