package com.coderman.changku.sys.commons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TreeNode {
    private Integer id;
    private Integer pid;
    private String title;
    private String icon;
    private String href;
    private Boolean spread;
    private Integer parentId;

    private String checkArr="0";//默认不选中




    private List<TreeNode> children=new ArrayList<>();

    /**
     * /用于角色分配数据返回格式
     * @param id
     * @param title
     * @param spread
     * @param checkArr
     */
    public TreeNode(Integer id, String title, Boolean spread, Integer parentId, String checkArr) {
        this.id = id;
        this.title = title;
        this.spread = spread;
        this.parentId = parentId;
        this.checkArr = checkArr;
    }

    /**
     * 用于左边菜单的数据返回格式
     * @param id
     * @param title
     * @param spread
     */
    public TreeNode(Integer id, Integer pid, String title, String icon, String href, Boolean spread) {
        this.id = id;
        this.pid = pid;
        this.title = title;
        this.icon = icon;
        this.href = href;
        this.spread = spread;
    }


    public TreeNode(Integer id, Integer parentId, String title, Boolean spread) {
        this.id = id;
        this.parentId = parentId;
        this.title = title;
        this.spread = spread;
    }
}
