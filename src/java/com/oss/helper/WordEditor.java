package com.oss.helper;
public class WordEditor {
   public static String getLessWord(String s){
       if(s.length()>80){
           String s1=s.substring(0, 70)+"...";
           return s1;
       }
       return s;
   }    
}
