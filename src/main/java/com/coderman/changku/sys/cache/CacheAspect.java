package com.coderman.changku.sys.cache;

import com.coderman.changku.sys.modal.Department;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

/**
 * 缓存切面
 */
@Aspect
@Component
@EnableAspectJAutoProxy
public class CacheAspect {
    /**
     * 缓存容器
     */
    private Map<String, Object> CACHE_CONTAINER = new HashMap<>();

    private static final String CHACHE_DEPT_PR = "dept:";
    /**
     * 切面表达式
     */
    private static final String POINT_CUT_DEPT_UPDATE = "execution(* com.coderman.changku.sys.service.Impl.DepartmentServiceImpl.update(..))";
    private static final String POINT_CUT_DEPT_DELETE = "execution(* com.coderman.changku.sys.service.Impl.DepartmentServiceImpl.delete(..))";
    private static final String POINT_CUT_DEPT_LIST_ONE = "execution(* com.coderman.changku.sys.service.Impl.DepartmentServiceImpl.findOneById(..))";



    /**
     * 删除切入缓存
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around(value = POINT_CUT_DEPT_DELETE)
    public Object cacheDelete(ProceedingJoinPoint proceedingJoinPoint) {
        Integer id = (Integer) proceedingJoinPoint.getArgs()[0];
        try {
            proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            return null;
        }
        CACHE_CONTAINER.remove(CHACHE_DEPT_PR+id);
        return 1;
    }



    /**
     * 更新切入
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around(value = POINT_CUT_DEPT_UPDATE)
    public Object cacheUpdate(ProceedingJoinPoint proceedingJoinPoint) {
        Department department = (Department) proceedingJoinPoint.getArgs()[0];
        try {
            proceedingJoinPoint.proceed();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
            return null;
        }
        CACHE_CONTAINER.put(CHACHE_DEPT_PR+department.getId(),department);
        return 1;
    }

    /**
     * 查询切入
     * @param proceedingJoinPoint
     * @return
     * @throws Throwable
     */
    @Around(value = POINT_CUT_DEPT_LIST_ONE)
    public Object cacheFindOne(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
        Object o = proceedingJoinPoint.getArgs()[0];
        Object result = CACHE_CONTAINER.get(CHACHE_DEPT_PR + o);
        if (result != null) {
            return result;
        } else {
            Department result2 = (Department) proceedingJoinPoint.proceed();
            CACHE_CONTAINER.put(CHACHE_DEPT_PR + result2.getId(), result2);
            return result2;
        }
    }


}
