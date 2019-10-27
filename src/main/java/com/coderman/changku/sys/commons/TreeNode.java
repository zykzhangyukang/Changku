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

    private List<TreeNode> children=new ArrayList<>();

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
