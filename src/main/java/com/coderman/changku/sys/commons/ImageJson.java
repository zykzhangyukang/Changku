package com.coderman.changku.sys.commons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Created by zhangyukang on 2019/10/31 16:10
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageJson {

    private String src;

    private String alt;

    private String pid;

    private String thumb;

}
