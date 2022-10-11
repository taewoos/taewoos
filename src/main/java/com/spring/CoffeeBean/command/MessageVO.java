package com.spring.CoffeeBean.command;

import java.sql.Timestamp;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MessageVO {
   
   private int msgNo;
   private String userId;
   private String msgTitle;
   private String msgContent;
   private String receiver;
   @JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm:ss")
   private Timestamp msgDate;

}