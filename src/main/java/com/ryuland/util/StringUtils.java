package com.ryuland.util;

import java.text.Normalizer;
import java.util.regex.Pattern;

public class StringUtils {
	public static String chuyenMa(String s) {
        String temp = Normalizer.normalize(s, Normalizer.Form.NFD);
        Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
        String code = pattern.matcher(temp).replaceAll("").replaceAll("Đ", "D").replace("đ", "d");

        String[] codes = code.split(" ");
        StringBuilder codeNew = new StringBuilder(codes[0]);
        for(int i=1;i<codes.length;i++) codeNew.append("-"+codes[i]);
        return codeNew.toString().toLowerCase();
    }
}
