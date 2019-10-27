package com.coderman.changku.sys.realms;

import com.coderman.changku.sys.commons.ActiveUser;
import com.coderman.changku.sys.modal.User;
import com.coderman.changku.sys.service.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;

    @Override
    public String getName() {
        return this.getClass().getSimpleName();
    }

    /**用户认证
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
            return new SimpleAuthenticationInfo(activeUser,  hashedCredentials,  credentialsSalt, getName());
        }
        return null;
    }
    /**
     *
     * @param principalCollection
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }


}
