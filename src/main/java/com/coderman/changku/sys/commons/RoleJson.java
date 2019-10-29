package com.coderman.changku.sys.commons;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 封装窜朔框的Json
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RoleJson {
    private String value;
    private String title;
    private String disable;
}
