package com.coderman.changku.sys.commons;

import java.util.ArrayList;
import java.util.List;

public class TreeNodeBuilder {

    /**
     * 构建层级关系的集合
     * @param treeNodes
     * @param topId
     * @return
     */
    public static List<TreeNode> build(List<TreeNode> treeNodes,Integer topId){
        List<TreeNode> nodes=new ArrayList<>();
        for (TreeNode n1 : treeNodes) {
            if(n1.getPid()==topId){
                nodes.add(n1);
            }
            for (TreeNode n2 : nodes) {
                if(n1.getPid()==n2.getId()){
                    n2.getChildren().add(n1);
                }
            }
        }
        return nodes;
    }
}
