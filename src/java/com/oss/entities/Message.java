package com.oss.entities;

public class Message {
   private String msgClass;
   private String content;
    public Message(String msgClass, String content) {
        this.msgClass = msgClass;
        this.content = content;
    }

    public String getMsgClass() {
        return msgClass;
    }

    public void setMsgClass(String msgClass) {
        this.msgClass = msgClass;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
