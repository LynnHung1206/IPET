package com.core.model.entities;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author Yu-Jing
 * @create 2023/1/5 上午 10:52
 */

@Data
@Getter
@ToString
public class Core implements Serializable {
    private static final long serialVersionUID = 1457755989409740329L;
    private boolean successful;
    private String message;

}
